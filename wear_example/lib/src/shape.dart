import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

const MethodChannel _channel = const MethodChannel('wear');

enum Shape { square, round }

typedef Widget WatchShapeBuilder(
  BuildContext context,
  Shape shape,
);

class WatchShape extends StatefulWidget {
  WatchShape({Key key, @required this.builder})
      : assert(builder != null),
        super(key: key);
  final WatchShapeBuilder builder;

  @override
  createState() => _WatchShapeState();
}

class _WatchShapeState extends State<WatchShape> {
  Shape shape;

  @override
  initState() {
    super.initState();
    // Default to round until the platform returns the shape
    // round being the most common form factor for WearOS
    shape = Shape.round;
    _setShape();
  }

  /// Sets the watch face shape
  _setShape() async {
    shape = await _getShape();
    setState(() => shape);
  }

  /// Fetches the shape of the watch face
  Future<Shape> _getShape() async {
    try {
      final int result = await _channel.invokeMethod('getShape');
      return result == 1 ? Shape.square : Shape.round;
    } on PlatformException catch (e) {
      // Default to round
      debugPrint('Error detecting shape: $e');
      return Shape.round;
    }
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, shape);
}
