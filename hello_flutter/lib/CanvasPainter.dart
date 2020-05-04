import 'package:flutter/material.dart';

class MyCanvasPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    {
      Paint paint = Paint();
      paint.color = Colors.amber;
      canvas.drawCircle(Offset(100.0, 200.0), 40.0, paint);
    }

    {
      Paint paint = Paint();
      paint.color = Colors.lightBlue;
      Rect rect = Rect.fromPoints(Offset(150.0, 300.0), Offset(300.0, 400.0));
      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  @override
  bool shouldRebuildSemantics(CustomPainter oldDelegate) {
    return false;
  }
}

class MyCanvas extends StatefulWidget {
  MyCanvas() : super();

  @override
  State<StatefulWidget> createState() {
    return _MyCanvas();
  }
}

class _MyCanvas extends State<MyCanvas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(painter: MyCanvasPainter()),
    );
  }
}
