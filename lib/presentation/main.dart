
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widget/news_widget.dart';

void main() {

  runApp(GetMaterialApp(home: MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NewsWidget();
  }
}
