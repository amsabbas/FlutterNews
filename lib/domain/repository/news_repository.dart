
import 'package:flutter_app/data/model/news.dart';
import 'package:get/get_connect.dart';

abstract class NewsRepository {
  Future<List<News>> getNews();
}