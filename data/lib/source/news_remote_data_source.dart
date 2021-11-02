import 'package:data/model/news.dart';

import 'network/news_api_service.dart';

class NewsRemoteDataSource {
  final NewsApiService apiService;

  NewsRemoteDataSource({this.apiService});

  Future<List<News>> getNews() {
    return apiService.getNews();
  }
}