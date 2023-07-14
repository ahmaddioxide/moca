import 'package:flutter/material.dart';


class DrawingScreen extends StatefulWidget {
  const DrawingScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawing Screen'),
      ),
      body: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          RenderBox referenceBox = context.findRenderObject() as RenderBox;
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
      floatingActionButton: FloatingActionButton(
        onPressed: _clearPoints,
        child: Icon(Icons.clear),
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
