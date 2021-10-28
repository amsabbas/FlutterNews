
import 'package:flutter_app/data/model/news.dart';

abstract class NewsRepository {
  Future<List<News>> getNews();
}