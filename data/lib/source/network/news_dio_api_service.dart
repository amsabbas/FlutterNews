import 'package:data/model/exception.dart';
import 'package:data/model/news.dart';
import 'package:dio/dio.dart';
class NewsDioApiService {
  Future<List<NewsData>> getNews() async {
    try {
      final response = await Dio()
          .get('https://run.mocky.io/v3/4ab1b4c3-0d81-4f6a-a42f-206ce307dd10');
      if (response.statusCode == 200) {
        return List<NewsData>.from(
            response.data["news"].map((d) => NewsData.fromJson(d)));
      } else {
        throw ServerException("failure", response.statusCode);
      }
    } catch (error) {
      //return Future.error(ServerException(error.toString()));
      throw ServerException(error.toString());
    }
  }
}
