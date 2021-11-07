import 'package:domain/interactor/news_use_case.dart';
import 'package:domain/model/news_model.dart';
import 'package:domain/model/news_error.dart';
import 'package:either_dart/either.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_it/get_it.dart';

class NewsController extends GetxController {
  List<NewsModel> news = [];

  Future<Either<NewsError, List<NewsModel>>> getNews() async {
    var data = await GetIt.instance<GetNews>().call();
    data.fold((left) => {}, (right) => updateNews(data.right));
    return data;
  }

  void updateNews(List<NewsModel> data) {
    news.addAll(data);
    update();
  }
}
