import 'package:domain/news/model/error.dart';

class ServerException implements Exception {
  final String message;
  final int? code;

  ServerException(this.message, [this.code]);

  Error getError() {
    if (code == 500 || code == 400) {
      return Error.general;
    } else if (code == 401 || code == 403) {
      return Error.unauthorized;
    } else {
      return Error.general;
    }
  }
}
