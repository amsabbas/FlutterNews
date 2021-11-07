import '../model/error.dart';
import '../model/news_model.dart';
import 'package:either_dart/either.dart';

import '../repository/news_repository.dart';

class GetNews {
  final NewsRepository repository;

  GetNews({required this.repository});

  Future<Either<Error, List<NewsModel>>> call() async {
    return repository.getNews();
  }
}
