import 'package:flutter/material.dart';
import 'package:flutter_app/data/model/news.dart';
import 'package:flutter_app/data/source/network/news_api_service.dart';

class NewsRemoteDataSource {

  final NewsApiService apiService;

  NewsRemoteDataSource({@required this.apiService});

  Future<List<News>> getNews(){
    return apiService.getNews();
  }
}