import 'dart:convert';

import 'package:flutter_app/data/model/news.dart';
import 'package:get/get_connect/connect.dart';

class NewsApiService extends GetConnect {

  Future<List<News>> getNews() async {
    print("getNews");
    final data = await get(
        'https://run.mocky.io/v3/7869b1fa-2dc5-4e7e-8aa4-244ecf8ea879');
    var result = json.decode(data.bodyString)["news"] as List;
    return List<News>.from(result.map((d) => News.fromJson(d)));;
  }
}
