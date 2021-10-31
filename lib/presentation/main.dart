import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'injection_container.dart';
import 'screen/news_screen.dart';

void main() {
  init();
  runApp(GetMaterialApp(
    home: MyApp(),
    theme: ThemeData(
      primaryColor: Colors.blue,
      textTheme: TextTheme(
          headline6: TextStyle(
              color: Colors.black, fontSize: 16.0, fontFamily: "Raleway"),
          subtitle1: TextStyle(
              color: Colors.blue, fontSize: 16.0, fontFamily: "Raleway"),
          bodyText1: TextStyle(
              color: Colors.blue, fontSize: 14.0, fontFamily: "Raleway")),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NewsScreen();
  }
}
