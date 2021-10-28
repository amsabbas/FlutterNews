import 'dart:convert';

import 'package:flutter_app/data/model/news.dart';
import 'package:get/get_connect/connect.dart';

class NewsApiService extends GetConnect {

  Future<List<News>> getNews() async {
    final data = await get(
        'https://run.mocky.io/v3/4ab1b4c3-0d81-4f6a-a42f-206ce307dd10');
    var result = json.decode(data.bodyString)["news"] as List;
    return List<News>.from(result.map((d) => News.fromJson(d)));
  }
}
