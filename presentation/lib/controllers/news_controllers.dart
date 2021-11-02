import 'package:domain/interactor/news_use_case.dart';
import 'package:domain/model/news_domain_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_it/get_it.dart';

class NewsController extends GetxController {
  List<NewsModel> news = [];

  Future<List<NewsModel>> getNews() async {
    var data = await GetIt.instance<GetNews>().call();
    updateNews(data);
    return data;
  }

  void updateNews(List<NewsModel> data) {
    news.addAll(data);
    update();
  }

}
