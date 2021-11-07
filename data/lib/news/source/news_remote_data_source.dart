
import '../model/news.dart';
import 'network/news_dio_api_service.dart';

class NewsRemoteDataSource {
  final NewsDioApiService apiService;

  NewsRemoteDataSource({required this.apiService});

  Future<List<NewsData>> getNews() {
    return apiService.getNews();
  }
}
