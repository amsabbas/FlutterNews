import 'dart:convert';
import 'package:flutter_app/data/model/news.dart';
import 'package:flutter_app/presentation/utils/log_filter.dart';
import 'package:get/get_connect/connect.dart';
import 'package:logger/logger.dart';

class NewsApiService extends GetConnect {

  @override
  void onInit() {
    var headers = {'Authorization': "Bearer "};
    httpClient.addAuthenticator((request) async {
      request.headers.addAll(headers);
      return request;
    });

  }

  @override
  set trustedCertificates(List<TrustedCertificate> _trustedCertificates) {
    super.trustedCertificates = _trustedCertificates;
  }

  Future<List<News>> getNews() async {



    final data = await get(
        'https://run.mocky.io/v3/4ab1b4c3-0d81-4f6a-a42f-206ce307dd10');
    var result = json.decode(data.bodyString)["news"] as List;
    var logger = Logger(filter: MyLogFilter());
    logger.d("getNewsLog: " + result.toString());
    return List<News>.from(result.map((d) => News.fromJson(d)));
  }
}
