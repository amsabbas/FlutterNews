import 'package:domain/model/news_domain_model.dart';

abstract class NewsRepository {
  Future<List<NewsModel>> getNews();
}
