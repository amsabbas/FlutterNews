import 'package:flutter_app/data/model/news.dart';
import 'package:get/get_connect.dart';

import '../repository/news_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
class GetNews {

  final NewsRepository repository;

  GetNews({@required this.repository});

  Future<List<News>> call() async {
    return repository.getNews();
  }
}