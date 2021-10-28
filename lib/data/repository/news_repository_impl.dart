import 'package:flutter/material.dart';
import 'package:flutter_app/data/model/news.dart';
import 'package:flutter_app/data/source/news_remote_data_source.dart';
import 'package:flutter_app/domain/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({@required this.remoteDataSource});

  @override
  Future<List<News>> getNews() {
    return remoteDataSource.getNews();
  }
}
