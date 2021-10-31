import 'package:flutter_app/data/model/news.dart';

import '../repository/news_repository.dart';
class GetNews {

  final NewsRepository repository;

  GetNews({ this.repository});

  Future<List<News>> call() async {
    return repository.getNews();
  }
}