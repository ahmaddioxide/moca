import 'dart:ui' as ui;
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';


class DrawingScreen extends StatefulWidget {
  const DrawingScreen({Key? key}) : super(key: key);

  @override
  _DrawingScreenState createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  List<Offset> _points = <Offset>[];

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
      try {
        ui.PictureRecorder recorder = ui.PictureRecorder();
        Canvas canvas = Canvas(recorder);

        final paint = Paint()
          ..color = Colors.black
          ..strokeWidth = 3.0
          ..strokeCap = StrokeCap.round;

        for (int i = 0; i < _points.length - 1; i++) {
          if (_points[i] != null && _points[i + 1] != null) {
            canvas.drawLine(_points[i], _points[i + 1], paint);
          }
        }

        ui.Picture picture = recorder.endRecording();
        ui.Image image = await picture.toImage(
          context.size!.width.toInt(),
          context.size!.height.toInt(),
        );
        ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

        if (byteData != null) {
          if (!kIsWeb) {
            final directory = await getTemporaryDirectory();
            final imagePath = '${directory.path}/drawing.png';
            final File file = File(imagePath);
            await file.writeAsBytes(byteData.buffer.asUint8List());

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckDrawingScreen(imagePath: imagePath),
              ),
            );
          } else {
            final Uint8List bytes = byteData.buffer.asUint8List();
            final filePath = 'drawing.png';

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckDrawingScreen(bytes: bytes, filePath: filePath),
              ),
            );
          }
        }
      } catch (e) {
        print('Error saving drawing: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawing Screen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Draw a Cube Below',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _clearPoints,
            child: Icon(Icons.clear),
          ),
          SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: _saveDrawing,
            child: Icon(Icons.save),
          ),
        ],
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
      ..color = Colors.black
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => true;
}

class CheckDrawingScreen extends StatelessWidget {
  final String? imagePath;
  final Uint8List? bytes;
  final String? filePath;

  CheckDrawingScreen({this.imagePath, this.bytes, this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Drawing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null)
              Image.file(
                File(imagePath!),
                width: 200,
                height: 200,
              )
            else if (bytes != null)
              Image.memory(
                bytes!,
                width: 200,
                height: 200,
              ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement AI model check here
              },
              child: Text('Check Drawing'),
            ),
          ],
        ),
      ),
    );
  }
}
