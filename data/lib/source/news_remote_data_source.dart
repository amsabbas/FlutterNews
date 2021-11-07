import 'package:data/model/exception.dart';
import 'package:data/model/news.dart';
import 'package:either_dart/either.dart';

import 'network/news_dio_api_service.dart';

class NewsRemoteDataSource {
  final NewsDioApiService apiService;

  NewsRemoteDataSource({required this.apiService});

  Future<List<NewsData>> getNews() {
    return apiService.getNews();
  }
}
