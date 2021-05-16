import 'package:flutter/material.dart';
import 'package:hello_fullscroll/page_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        primaryColor: Colors.pink,
        accentColor: Colors.pinkAccent,
      ),
      home: Material(
        child: MainScreenPageView(),
      ),
    );
  }
}
