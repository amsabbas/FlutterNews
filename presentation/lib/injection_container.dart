
import 'package:data/repository/news_repository_impl.dart';
import 'package:data/source/network/news_api_service.dart';
import 'package:data/source/news_remote_data_source.dart';
import 'package:domain/interactor/news_use_case.dart';
import 'package:domain/repository/news_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerFactory<NewsApiService>(
    () => NewsApiService(),
  );


  getIt.registerFactory<NewsRemoteDataSource>(
    () => NewsRemoteDataSource(apiService: getIt<NewsApiService>()),
  );

  getIt.registerFactory<NewsRepository>(
    () => NewsRepositoryImpl(remoteDataSource: getIt<NewsRemoteDataSource>()),
  );

  getIt.registerFactory<GetNews>(
    () => GetNews(repository: getIt<NewsRepository>()),
  );
}
