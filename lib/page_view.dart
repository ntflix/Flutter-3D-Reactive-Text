import 'package:flutter/material.dart';
import 'package:hello_fullscroll/hello.dart';

class MainScreenPageView extends StatelessWidget {
  MainScreenPageView({Key? key}) : super(key: key);

  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      pageSnapping: true,
      controller: this.controller,
      children: <Widget>[
        Hello(
          onNextPagePressed: () => this.controller.nextPage(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              ),
        ),
      ],
    );
  }
}
