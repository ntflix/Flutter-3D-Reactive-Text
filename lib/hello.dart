import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hello_fullscroll/mouse_reactive_text.dart';
import 'dart:io' show Platform;

class Hello extends StatefulWidget {
  const Hello({Key? key, required this.onNextPagePressed}) : super(key: key);
  final VoidCallback onNextPagePressed;

  @override
  _HelloState createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  bool helloVisible = false;

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1), () => setState(() => this.helloVisible = true));

    return Container(
      // color: Theme.of(context).primaryColor,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          GestureReactiveText("Hello there.", sensitivity: 0.25),
          Column(
            children: [
              Spacer(),
              AnimatedOpacity(
                opacity: this.helloVisible ? 0.6 : 0.0,
                duration: Duration(milliseconds: 500),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: widget.onNextPagePressed,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Icon(Icons.chevron_right_sharp, size: 64),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
