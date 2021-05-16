import 'package:flutter/material.dart';
import 'dart:math' as math;

class PointerReactiveText extends StatefulWidget {
  const PointerReactiveText(this.text, {Key? key, this.sensitivity = 0.5})
      : super(key: key);
  final String text;
  final double sensitivity;

  @override
  _PointerReactiveTextState createState() => _PointerReactiveTextState();
}

class _PointerReactiveTextState extends State<PointerReactiveText> {
  double x = 0.0;
  double y = 0.0;

  void _updateLocation(double x, double y) {
    setState(() {
      this.x = x;
      this.y = y;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double xOffsetPercentage = ((this.x / (size.width)) - 0.5);
    double yOffsetPercentage = ((this.y / (size.height)) - 0.5);

    return GestureDetector(
      // GestureDetector for mobile support
      onPanUpdate: (details) {
        print(details);
        this._updateLocation(
            details.globalPosition.dx, details.globalPosition.dy);
      },
      child: MouseRegion(
        // MouseRegion for desktop support
        onHover: (details) {
          this._updateLocation(details.position.dx, details.position.dy);
        },
        child: Center(
          child: ReactiveText(
              text: widget.text,
              sensitivity: widget.sensitivity,
              xOffsetPercentage: xOffsetPercentage,
              yOffsetPercentage: yOffsetPercentage),
        ),
      ),
    );
  }
}

class ReactiveText extends StatelessWidget {
  const ReactiveText({
    Key? key,
    required this.text,
    required this.sensitivity,
    required this.xOffsetPercentage,
    required this.yOffsetPercentage,
  }) : super(key: key);

  final String text;
  final double sensitivity;
  final double xOffsetPercentage;
  final double yOffsetPercentage;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateY(-(math.pi * xOffsetPercentage) * this.sensitivity)
        ..rotateX((math.pi * yOffsetPercentage) * this.sensitivity),
      child: Text(
        this.text,
        style: TextStyle(fontSize: 72, shadows: [
          Shadow(
            offset: Offset(
              -10 * (xOffsetPercentage),
              -10 * (yOffsetPercentage),
            ),
            blurRadius: 5.0,
            color: Theme.of(context).accentColor,
          ),
          Shadow(
            offset: Offset(
              -15 * (xOffsetPercentage),
              -15 * (yOffsetPercentage),
            ),
            blurRadius: 30,
            color: Theme.of(context).accentColor,
          ),
        ]),
      ),
    );
  }
}