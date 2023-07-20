import 'package:flutter/material.dart' hide Ink;
import 'package:get/get.dart';
import 'package:google_mlkit_digital_ink_recognition/google_mlkit_digital_ink_recognition.dart';

class DigitalInkView extends StatefulWidget {
  @override
  State<DigitalInkView> createState() => _DigitalInkViewState();
}

class _DigitalInkViewState extends State<DigitalInkView> {
  late final DigitalInkRecognizerModelManager _modelManager =
  DigitalInkRecognizerModelManager();
  var _language = 'zxx-Zsym-x-autodraw';

  // Codes from https://developers.google.com/ml-kit/vision/digital-ink-recognition/base-models?hl=en#text
  // final _languages = [
  //   'zxx-Zsym-x-autodraw',
  // ];
  var _digitalInkRecognizer =
      DigitalInkRecognizer(languageCode: 'zxx-Zsym-x-autodraw');
  final Ink _ink = Ink();
  List<StrokePoint> _points = [];
  String _recognizedText = '';


  @override
  void dispose() {
    _digitalInkRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cube Test', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16,),
          child: Column(
            children: [
              const Text(
                'Draw this Cube as accurately as you can, in the given space.',
                style: TextStyle(fontSize: 18, color: Colors.deepPurple),),
              Image.asset('assets/images/cube.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Row(
                children: [
                  // _buildDropdown(),
                  ElevatedButton(
                    onPressed: _isModelDownloaded,
                    child: Text('Check Model'),
                  ),
                  ElevatedButton(
                    onPressed: _downloadModel,
                    child: Icon(Icons.download),
                  ),

                ],
              ),
              ElevatedButton(
                onPressed: _deleteModel,
                child: Icon(Icons.delete),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: _recogniseText,
                      child: Text('Read Text'),
                    ),
                    ElevatedButton(
                      onPressed: _clearPad,
                      child: Text('Clear Pad'),
                    ),
                  ],
                ),
              ),
              Expanded(

                child: Container(
                  color: Colors.grey[300],
                  child: GestureDetector(
                    onPanStart: (DragStartDetails details) {
                      _ink.strokes.add(Stroke());
                    },
                    onPanUpdate: (DragUpdateDetails details) {
                      setState(() {
                        final RenderObject? object = context.findRenderObject();
                        final localPosition = (object as RenderBox?)
                            ?.globalToLocal(details.localPosition);
                        if (localPosition != null) {
                          _points = List.from(_points)
                            ..add(StrokePoint(
                              x: localPosition.dx,
                              y: localPosition.dy,
                              t: DateTime.now().millisecondsSinceEpoch,
                            ));
                        }
                        if (_ink.strokes.isNotEmpty) {
                          _ink.strokes.last.points = _points.toList();
                        }
                      });
                    },
                    onPanEnd: (DragEndDetails details) {
                      _points.clear();
                      setState(() {});
                    },
                    child: CustomPaint(
                      painter: Signature(ink: _ink),
                      size: Size.infinite,
                    ),
                  ),
                ),
              ),
              if (_recognizedText.isNotEmpty)
                Text(
                  'Candidates: $_recognizedText',
                  style: TextStyle(fontSize: 23),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildDropdown() => DropdownButton<String>(
  //       value: _language,
  //       icon: const Icon(Icons.arrow_downward),
  //       elevation: 16,
  //       style: const TextStyle(color: Colors.blue),
  //       underline: Container(
  //         height: 2,
  //         color: Colors.blue,
  //       ),
  //       onChanged: (String? lang) {
  //         if (lang != null) {
  //           setState(() {
  //             _language = lang;
  //             _digitalInkRecognizer.close();
  //             _digitalInkRecognizer =
  //                 DigitalInkRecognizer(languageCode: _language);
  //           });
  //         }
  //       },
  //       items: _languages.map<DropdownMenuItem<String>>((lang) {
  //         return DropdownMenuItem<String>(
  //           value: lang,
  //           child: Text(lang),
  //         );
  //       }).toList(),
  //     );

  void _clearPad() {
    setState(() {
      _ink.strokes.clear();
      _points.clear();
      _recognizedText = '';
    });
  }

  Future<void> _isModelDownloaded() async {
    // dialog box that show model is getting checked
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Checking'),
            ),
        barrierDismissible: false);


    _modelManager
        .isModelDownloaded(_language)
        .then((value) => value ? Get.snackbar('Downloaded',"You can use app") : Get.snackbar("Not Downloaded", "Download Model First ")).then((value)=>Navigator.pop(context) );
    // Toast().show(
    //     'Checking if model is downloaded...',
    //
    //     context,
    //     this);
  }

  Future<void> _deleteModel() async {
    // dialog box that show model is getting deleted
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Deleting'),
            ),
        barrierDismissible: false);
    _modelManager
        .deleteModel(_language)
        .then((value) => value ? 'success' : 'failed')
        .then((value) => Navigator.pop(context));
    // Toast().show(
    //     'Deleting model...',
    //     _modelManager
    //         .deleteModel(_language)
    //         .then((value) => value ? 'success' : 'failed'),
    //     context,
    //     this);
  }

  Future<void> _downloadModel() async {
    // dialog box that show model is getting downloaded
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Downloading'),
            ),
        barrierDismissible: false);
    _modelManager
        .downloadModel(_language)
        .then((value) => value ? 'success' : 'failed')
        .then((value) => Navigator.pop(context));

    // Toast().show(
    //     'Downloading model...',
    //
    //     context,
    //     this);
  }

  Future<void> _recogniseText() async {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Recognizing'),
            ),
        barrierDismissible: true);
    try {
      final candidates = await _digitalInkRecognizer.recognize(_ink);
      _recognizedText = '';
      for (final candidate in candidates) {
        _recognizedText += '\n${candidate.text}${candidate.score}';
      }
      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
    Navigator.pop(context);
  }
}

class Signature extends CustomPainter {
  Ink ink;

  Signature({required this.ink});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;

    for (final stroke in ink.strokes) {
      for (int i = 0; i < stroke.points.length - 1; i++) {
        final p1 = stroke.points[i];
        final p2 = stroke.points[i + 1];
        canvas.drawLine(Offset(p1.x.toDouble(), p1.y.toDouble()),
            Offset(p2.x.toDouble(), p2.y.toDouble()), paint);
      }
    }
  }

  @override
  bool shouldRepaint(Signature oldDelegate) => true;
}
