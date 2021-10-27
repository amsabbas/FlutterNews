import 'package:flutter/material.dart';
import 'package:flutter_app/data/model/news.dart';
import 'package:flutter_app/data/source/news_remote_data_source.dart';
import 'package:flutter_app/domain/repository/news_repository.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({@required this.remoteDataSource});

  @override
  Future<List<News>> getNews() {
    return remoteDataSource.getNews();
  }
}
