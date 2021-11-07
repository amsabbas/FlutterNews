import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:get/get_connect/connect.dart';

import '../../model/exception.dart';
import '../../model/news.dart';

//unused class
class NewsApiService extends GetConnect {
  @override
  void onInit() {
    var headers = {'Authorization': "Bearer "};
  }

  @override
  set trustedCertificates(List<TrustedCertificate>? _trustedCertificates) {
    super.trustedCertificates = _trustedCertificates;
  }

  Future<Either<ServerException, List<NewsData>>> getNews() async {
    try {
      final data = await get(
          'https://run.mocky.io/v3/4ab1b4c3-0d81-4f6a-a42f-206ce307dd10');
      if (data.statusCode == 200) {
        var result = json.decode(data.bodyString!)["news"] as List;
        return Right(
            List<NewsData>.from(result.map((d) => NewsData.fromJson(d))));
      } else {
        return Left(ServerException("failure", data.statusCode));
      }
    } catch (error) {
      return Left(ServerException("connection"));
    }
  }
}
