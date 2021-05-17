import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hello_fullscroll/pointer_reactive_text.dart';

class InitialTextScreen extends StatefulWidget {
  const InitialTextScreen(this.text,
      {Key? key, required this.onNextPagePressed})
      : super(key: key);
  final VoidCallback onNextPagePressed;
  final String text;

  @override
  _InitialTextScreenState createState() => _InitialTextScreenState();
}

class _InitialTextScreenState extends State<InitialTextScreen> {
  bool helloVisible = false;

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1), () => setState(() => this.helloVisible = true));

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Center(
          child: PointerReactiveText(
            widget.text,
            onTap: widget.onNextPagePressed,
          ),
        ),
        AnimatedOpacity(
          opacity: this.helloVisible ? 0.6 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text("TAP", style: TextStyle(fontSize: 18)),
          ),
        ),
      ],
    );
  }
}
