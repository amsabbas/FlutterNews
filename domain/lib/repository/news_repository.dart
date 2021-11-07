
import 'package:domain/model/news_model.dart';
import 'package:domain/model/news_error.dart';
import 'package:either_dart/either.dart';

abstract class NewsRepository {
  Future<Either<NewsError,List<NewsModel>>> getNews();
}
