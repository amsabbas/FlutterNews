// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsData _$NewsFromJson(Map<String, dynamic> json) => NewsData(
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$NewsToJson(NewsData instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'image': instance.image,
    };
