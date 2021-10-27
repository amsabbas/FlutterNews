import 'package:flutter/material.dart';

class News {
  final int id;
  final String name;
  final String desc;

  News({
    @required this.id,
    @required this.name,
    @required this.desc,
  });

   static fromJson(dynamic json) {
    return News(
      id: json["id"] as int,
      name: json["title"] as String,
      desc: json["body"] as String,
    );
  }
}
