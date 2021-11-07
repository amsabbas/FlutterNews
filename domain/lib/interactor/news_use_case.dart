import 'package:domain/model/news_error.dart';
import 'package:domain/model/news_model.dart';
import 'package:either_dart/either.dart';

import '../repository/news_repository.dart';

class GetNews {
  final NewsRepository repository;

  GetNews({required this.repository});

  Future<Either<NewsError, List<NewsModel>>> call() async {
    return repository.getNews();
  }
}
