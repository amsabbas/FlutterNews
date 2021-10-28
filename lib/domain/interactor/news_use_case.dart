import 'package:flutter/material.dart';
import 'package:flutter_app/data/model/news.dart';

import '../repository/news_repository.dart';
class GetNews {

  final NewsRepository repository;

  GetNews({@required this.repository});

  Future<List<News>> call() async {
    return repository.getNews();
  }
}