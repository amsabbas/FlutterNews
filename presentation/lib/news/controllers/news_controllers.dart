import 'package:domain/news/interactor/news_use_case.dart';
import 'package:domain/news/model/news_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_it/get_it.dart';
import '../model/data_resource.dart';

class NewsController extends GetxController {
  DataResource<List<NewsModel>> newsResource = DataResource();

  Future<DataResource<List<NewsModel>>> getNews() async {
    var data = await GetIt.instance<GetNews>().call();
    data.fold((left) => {newsResource.error(left)},
        (right) => {newsResource.success(data.right)});
    return newsResource;
  }
}
