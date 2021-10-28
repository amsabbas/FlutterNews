import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsScreenDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Hero(tag: data[2], child: Image.network(data[2])),
              Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    data[0],
                    style: Theme.of(context).textTheme.headline6,
                  )),
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    data[1],
                    style: Theme.of(context).textTheme.bodyText1,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
