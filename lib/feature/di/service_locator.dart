import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/feature/daily_news/data/remote/news_api_service.dart';
import 'package:news_app/feature/daily_news/data/repository/news_repository_impl.dart';
import 'package:news_app/feature/daily_news/domain/repository/news_repository.dart';
import 'package:news_app/feature/daily_news/domain/usecases/get_news_usecase.dart';
import 'package:news_app/feature/daily_news/presentation/bloc/news_bloc.dart';

GetIt sl = GetIt.I;

Future<void> initDependencies() async {
  // Api
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  // Repository
  sl.registerSingleton<NewsRepository>(NewsRepositoryImpl(sl()));

  // Usecase
  sl.registerSingleton<GetNewsUsecase>(GetNewsUsecase(sl()));
  
  // Bloc
  sl.registerSingleton<NewsBloc>(NewsBloc(sl()));
  
}
