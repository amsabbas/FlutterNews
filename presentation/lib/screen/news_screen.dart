import 'package:domain/model/news_domain_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        child: FutureBuilder<List<NewsModel>>(
          future: controller.getNews(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              //showDialog();
              print("snapshot" + snapshot.error.toString());
            }

            return snapshot.connectionState == ConnectionState.waiting ||
                    snapshot.data == null
                ? Center(child: CircularProgressIndicator())
                : NewsItemList(news: snapshot.data!);
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
