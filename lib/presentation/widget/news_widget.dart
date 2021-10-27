import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/model/news.dart';
import 'package:flutter_app/data/repository/news_repository_impl.dart';
import 'package:flutter_app/data/source/network/news_api_service.dart';
import 'package:flutter_app/data/source/news_remote_data_source.dart';
import 'package:flutter_app/domain/interactor/news_use_case.dart';

import 'news_item_list_widget.dart';

class NewsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsWidgetState();
  }
}

class _NewsWidgetState extends State<NewsWidget> {
  Future<List<News>> getNews() {
    GetNews newsUseCase = GetNews(
      repository: NewsRepositoryImpl(
        remoteDataSource: NewsRemoteDataSource(
          apiService: NewsApiService(),
        ),
      ),
    );
    return newsUseCase.call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: Center(
        child: FutureBuilder<List<News>>(
          future: getNews(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.connectionState == ConnectionState.waiting || snapshot.data == null
                ? Center(child: CircularProgressIndicator())
                : NewsItemList(news: snapshot.data);
          },
        ),
      ),
    );
  }
}
