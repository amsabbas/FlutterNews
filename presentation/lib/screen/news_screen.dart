import 'package:domain/model/news_model.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:domain/model/news_error.dart';
import 'package:presentation/controllers/news_controllers.dart';

import '../widget/news_item_list_widget.dart';

class NewsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsScreenState();
  }
}

class _NewsScreenState extends State<NewsScreen> {
  final NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("News"),
      ),
      body: Center(
        child: FutureBuilder<Either<NewsError, List<NewsModel>>>(
          future: controller.getNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError ||
                (snapshot.data != null && snapshot.data!.isLeft)) {
              showDialog();
              return Container();
            } else {
              return NewsItemList(news: snapshot.data!.right);
            }
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
          title: Text(
            "Failed",
            style: Theme.of(context).textTheme.headline5,
          ),
          content: Text("Something went wrong",
              style: Theme.of(context).textTheme.headline6),
          actions: <Widget>[
            TextButton(
                child: Text(
                  'OK',
                  style: Theme.of(context).textTheme.headline6,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        ),
      ),
    );
  }
}
