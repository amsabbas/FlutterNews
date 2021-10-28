import 'package:json_annotation/json_annotation.dart';

//@JsonSerializable()
class News {
  //@JsonKey(name: "id")
  final int id;
  //@JsonKey(name: "title")
  final String title;
  //@JsonKey(name: "body")
  final String body;
  //@JsonKey(name: "image")
  final String image;

  News({this.id, this.title, this.body, this.image});

  static fromJson(dynamic json) {
    return News(
        id: json["id"] as int,
        title: json["title"] as String,
        body: json["body"] as String,
        image: json['image'] as String);
  }


  // factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  // Map<String, dynamic> toJson() => _$NewsToJson(this);
}
