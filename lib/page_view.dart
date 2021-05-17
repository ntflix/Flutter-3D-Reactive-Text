import 'package:flutter/material.dart';
import 'package:hello_fullscroll/hello.dart';
import 'package:hello_fullscroll/pointer_reactive_text.dart';

class MainScreenPageView extends StatelessWidget {
  MainScreenPageView({Key? key}) : super(key: key);

  final PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      pageSnapping: true,
      controller: this.controller,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        InitialTextScreen(
          "Hello.",
          onNextPagePressed: () => this.controller.nextPage(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              ),
        ),
        PointerReactiveText(
          "One",
          onTap: () => this.controller.nextPage(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              ),
        ),
        PointerReactiveText(
          "Two",
          onTap: () => this.controller.nextPage(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              ),
        ),
        PointerReactiveText(
          "Three",
          onTap: () => this.controller.animateToPage(
                0,
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              ),
        ),
      ],
    );
  }
}
