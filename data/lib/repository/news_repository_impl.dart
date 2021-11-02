import 'package:data/source/news_remote_data_source.dart';
import 'package:domain/model/news_domain_model.dart';
import 'package:domain/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<NewsModel>> getNews() async {
    var news = await remoteDataSource.getNews();
    var newsModel = List<NewsModel>.from(news.map((e) =>
        NewsModel(id: e.id, title: e.title, body: e.body, image: e.image)));
    return newsModel;
  }
}
