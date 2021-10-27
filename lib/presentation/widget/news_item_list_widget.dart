import 'package:flutter/material.dart';
import 'package:flutter_app/data/model/news.dart';

class NewsItemList extends StatelessWidget {
  final List<News> news;

  NewsItemList({this.news}) ;

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
                  title: Text(
                    '${news[position].name}',
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
