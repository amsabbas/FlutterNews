
import 'package:data/news/repository/news_repository_impl.dart';
import 'package:data/news/source/network/news_dio_api_service.dart';
import 'package:data/news/source/news_remote_data_source.dart';
import 'package:domain/news/interactor/news_use_case.dart';
import 'package:domain/news/repository/news_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerFactory<NewsDioApiService>(
    () => NewsDioApiService(),
  );


  getIt.registerFactory<NewsRemoteDataSource>(
    () => NewsRemoteDataSource(apiService: getIt<NewsDioApiService>()),
  );

  getIt.registerFactory<NewsRepository>(
    () => NewsRepositoryImpl(remoteDataSource: getIt<NewsRemoteDataSource>()),
  );

  getIt.registerFactory<GetNews>(
    () => GetNews(repository: getIt<NewsRepository>()),
  );
}
