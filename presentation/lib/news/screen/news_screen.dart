import 'package:domain/news/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/news_controllers.dart';
import '../model/data_resource.dart';

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
        child: FutureBuilder<DataResource<List<NewsModel>>>(
          future: controller.getNews(),
          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.data != null) {
              switch (snapshot.data!.status) {
                case Status.loading:
                  return const Center(child: CircularProgressIndicator());

                case Status.error:
                  showDialog();
                  return Container();

                case Status.success:
                  return NewsItemList(snapshot.data?.data);
              }
            } else {
              showDialog();
              return Container();
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
