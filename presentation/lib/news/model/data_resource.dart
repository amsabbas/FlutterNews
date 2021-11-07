import 'package:domain/news/model/error.dart';
class DataResource<T> {
  Status status = Status.loading;
  T? data;
  Error? errorType;

  void loading() {
    status = Status.loading;
  }

  void success(T data) {
    this.data = data;
    status = Status.success;
  }

  void error(Error error) {
    errorType = error;
    status = Status.error;
  }
}

enum Status {
  loading,
  success,
  error,
}
