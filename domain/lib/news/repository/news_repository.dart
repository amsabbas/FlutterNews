import '../model/news_model.dart';
import '../model/error.dart';
import 'package:either_dart/either.dart';

abstract class NewsRepository {
  Future<Either<Error,List<NewsModel>>> getNews();
}
