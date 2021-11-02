

import 'package:domain/model/news_domain_model.dart';

import '../repository/news_repository.dart';

class GetNews {
  final NewsRepository repository;

  GetNews({required this.repository});

  Future<List<NewsModel>> call() async {
    return repository.getNews();
  }
}
