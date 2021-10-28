import 'package:flutter/material.dart';
import 'package:flutter_app/data/model/news.dart';
import 'package:flutter_app/data/repository/news_repository_impl.dart';
import 'package:flutter_app/data/source/network/news_api_service.dart';
import 'package:flutter_app/data/source/news_remote_data_source.dart';
import 'package:flutter_app/domain/interactor/news_use_case.dart';
import 'package:get/get.dart';

import '../widget/news_item_list_widget.dart';

class NewsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsScreenState();
  }
}

class _NewsScreenState extends State<NewsScreen> {
  Future<List<News>> getNews() {
    try {
      GetNews newsUseCase = GetNews(
        repository: NewsRepositoryImpl(
          remoteDataSource: NewsRemoteDataSource(
            apiService: NewsApiService(),
          ),
        ),
      );
      return newsUseCase.call();
    } catch (error) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("News"),
      ),
      body: Center(
        child: FutureBuilder<List<News>>(
          future: getNews(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              //showDialog();
              print("snapshot" + snapshot.error.toString());
            }
            return snapshot.connectionState == ConnectionState.waiting ||
                    snapshot.data == null
                ? Center(child: CircularProgressIndicator())
                : NewsItemList(news: snapshot.data);
          },
        ),
      ),
    );
  }

  void showDialog() {
    Future.delayed(
      Duration.zero,
      () => Get.dialog(
        AlertDialog(
          title: Text("Failed"),
          content: Text("Something went wrong"),
          actions: <Widget>[],
        ),
      ),
    );
  }
}