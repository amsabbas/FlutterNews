

import 'package:domain/model/news_domain_model.dart';

import '../repository/news_repository.dart';

class GetNews {
  final NewsRepository repository;

  GetNews({this.repository});

  Future<List<NewsModel>> call() async {
    return repository.getNews();
  }
}
