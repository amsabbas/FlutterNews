import 'package:data/model/exception.dart';
import 'package:data/source/news_remote_data_source.dart';
import 'package:domain/model/news_model.dart';
import 'package:domain/repository/news_repository.dart';
import 'package:domain/model/news_error.dart';
import 'package:either_dart/either.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<NewsError, List<NewsModel>>> getNews() async {
    try {
      var news = await remoteDataSource.getNews();
      var newsModel = List<NewsModel>.from(news.map((e) =>
          NewsModel(id: e.id, title: e.title, body: e.body, image: e.image)));
      return Right(newsModel);
    } catch (error) {
      return Left((error as ServerException).getError());
    }
  }
}
