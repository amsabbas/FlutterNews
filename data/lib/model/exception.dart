import 'package:domain/model/news_error.dart';

class ServerException implements Exception {
  final String message;
  final int? code;

  ServerException(this.message, [this.code]);

  NewsError getError() {
    if (code == 500 || code == 400) {
      return NewsError.GENERAL_ERROR;
    } else if (code == 401 || code == 403) {
      return NewsError.UNAUTHORIZED_ERROR;
    } else {
      return NewsError.GENERAL_ERROR;
    }
  }
}
