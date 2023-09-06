import 'dart:ui' as ui;
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moca/views/test/visuospatial_clock_test_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

import '../../controllers/cube_drawing_controller.dart';

class Classifier {
  /// Instance of Interpreter
  late Interpreter _interpreter;

  static const String modelFile = "assets/model_unquant.tflite";

  /// Loads interpreter from asset
  Future<void> loadModel({Interpreter? interpreter}) async {
    try {
      _interpreter = interpreter ??
          await Interpreter.fromAsset(
            "assets/model_unquant.tflite",
            options: InterpreterOptions()..threads = 4,
          );

      _interpreter.allocateTensors();
    } catch (e) {
      Get.snackbar('Error', "Error loading model",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  /// Gets the interpreter instance
  Interpreter get interpreter => _interpreter;

  predict(img.Image image) async {
    img.Image resizedImage = img.copyResize(image, width: 150, height: 150);

    // Convert the resized image to a 1D Float32List.
    Float32List inputBytes = Float32List(1 * 150 * 150 * 3);
    int pixelIndex = 0;
    for (int y = 0; y < resizedImage.height; y++) {
      for (int x = 0; x < resizedImage.width; x++) {
        int pixel = resizedImage.getPixel(x, y);
        inputBytes[pixelIndex++] = img.getRed(pixel) / 127.5 - 1.0;
        inputBytes[pixelIndex++] = img.getGreen(pixel) / 127.5 - 1.0;
        inputBytes[pixelIndex++] = img.getBlue(pixel) / 127.5 - 1.0;
      }
    }

    // Reshape to input format specific for model. 1 item in list with pixels 150x150 and 3 layers for RGB
    final input = inputBytes.reshape([1, 150, 150, 3]);
    final output = List.filled(1 * 2, 0).reshape([1, 2]);
    interpreter.run(input, output);
    return output;
  }
}

class DrawingScreen extends StatefulWidget {
  const DrawingScreen({Key? key}) : super(key: key);

  @override
  _DrawingScreenState createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  late SharedPreferences sf;
  @override
  void initState() {
    super.initState();
    initalizeSharedPref();
  }

  Future<void> initalizeSharedPref() async {
    sf = await SharedPreferences.getInstance();
  }

  List<Offset> _points = <Offset>[];

  final classifier = Classifier();
  final CubeController _cubeController = Get.put(CubeController());

  Future<void> initializeModel() async {
    await classifier.loadModel();
  }

  String processResult(List<dynamic> outputs) {
    if (outputs[0][0] == 1) {
      _cubeController.saveScore(0);
      return 'Not A Cube';
    } else {
      _cubeController.saveScore(1);
      return 'Cube';
    }
  }

  void _addPoint(Offset? point) {
    if (point != null) {
      setState(() {
        _points = List.from(_points)..add(point);
      });
    }
  }

  void _clearPoints() {
    setState(() {
      _points.clear();
    });
  }

  void _saveDrawing() async {
    if (_points.isNotEmpty) {
      initializeModel();
      try {
        ui.PictureRecorder recorder = ui.PictureRecorder();
        double canvasWidth = context.size!.width;
        double canvasHeight = context.size!.height;
        double borderWidth =
            20.0; // Adjust this value as needed for the size of the border
        double drawingWidth = canvasWidth;
        double drawingHeight = canvasHeight;

        // Create a new image with a white background
        final ui.Image bgImage = await createBlankImage(
          drawingWidth.toInt(),
          drawingHeight.toInt(),
          Colors.white,
        );

        Canvas canvas = Canvas(recorder);

        // Draw the background image
        canvas.drawImage(bgImage, Offset.zero, Paint());

        // Translate the canvas to center the drawing within the border
        canvas.translate(borderWidth, borderWidth);

        final paint = Paint()
          ..color = Colors.red
          ..strokeWidth = 50.0
          ..strokeCap = StrokeCap.round;

        // Draw the lines
        for (int i = 0; i < _points.length - 1; i++) {
          canvas.drawLine(_points[i], _points[i + 1], paint);
        }

        // End the recording and get the image
        ui.Picture picture = recorder.endRecording();
        ui.Image image = await picture.toImage(
          drawingWidth.toInt(),
          drawingHeight.toInt(),
        );

        ByteData? byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);

        if (byteData != null) {
          if (!kIsWeb) {
            final directory = await getTemporaryDirectory();
            final imagePath =
                '${directory.path}/drawing.png'; // Change the extension to .png
            final File file = File(imagePath);
            await file.writeAsBytes(byteData.buffer.asUint8List());

            final imageFile = File(imagePath);
            var results = await classifier.predict(
              img.decodeImage(imageFile.readAsBytesSync())!,
            );

            processResult(results);
            sf.setInt('nextGame', 3);
            Get.to(() => const ClockTestScreen());
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => CheckDrawingScreen(imagePath: imagePath),
            //   ),
            // );
          } else {
            // If you are using this for web, you can convert ByteData directly to Uint8List
            final Uint8List bytes = byteData.buffer.asUint8List();
            const filePath = 'drawing.png';
          }
        }
      } catch (e) {
        Get.snackbar('Error', "Error saving drawing",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    }
  }

  Future<ui.Image> createBlankImage(int width, int height, Color color) async {
    final ui.PictureRecorder recorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(recorder);
    final Paint paint = Paint()..color = color;
    canvas.drawRect(
        Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()), paint);
    return await recorder.endRecording().toImage(width, height);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Drawing Test',
          style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
            padding: EdgeInsets.only(top: 5, right: 16, left: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: const Text(
                    "Draw a Cube Below, and Don't lift your Finger while Drawing",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, overflow: TextOverflow.visible),
                  ),
                ),
                // Text(
                //   "60",
                //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                // ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onPanUpdate: (DragUpdateDetails details) {
                RenderBox referenceBox =
                    context.findRenderObject() as RenderBox;
                Offset localPosition =
                    referenceBox.globalToLocal(details.globalPosition);
                _addPoint(localPosition);
              },
              onPanEnd: (DragEndDetails details) => _addPoint(null),
              child: CustomPaint(
                painter: DrawingPainter(points: _points),
                size: Size.infinite,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'btn1',
              onPressed: _clearPoints,
              child: const Icon(Icons.clear),
            ),
            const SizedBox(height: 20.0),
            FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: Colors.deepPurple,
              heroTag: 'btn2',
              onPressed: _saveDrawing,
              child: const Icon(Icons.arrow_forward,
                  color: Colors.white, size: 30.0),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  List<Offset> points;

  DrawingPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => true;
}
