import 'package:domain/model/news_domain_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/controllers/news_controllers.dart';
import 'package:presentation/screen/news_details_screen.dart';

class NewsItemList extends StatelessWidget {


  final List<NewsModel> news;

  NewsItemList({this.news});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: ListView.builder(
          itemCount: news.length,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (context, position) {
            return Column(
              children: <Widget>[
                Divider(height: 5.0),
                ListTile(
                  onTap: () {
                    Get.to(NewsScreenDetails(), arguments: [
                      news[position].title,
                      news[position].body,
                      news[position].image
                    ]);
                  },
                  title: Text(
                    '${news[position].title}',
                    style: Theme.of(context).textTheme.subtitle1,
                    maxLines: 1,
                  ),
                  leading: Hero(
                    tag: news[position].image,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage('${news[position].image}'),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
