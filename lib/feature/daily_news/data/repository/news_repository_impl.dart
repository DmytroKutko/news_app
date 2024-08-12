import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/feature/daily_news/data/models/article.dart';
import 'package:news_app/feature/daily_news/data/remote/news_api_service.dart';
import 'package:news_app/feature/daily_news/domain/repository/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsApiService service;

  NewsRepositoryImpl(this.service);

  @override
  Future<DataState<List<ArticleModel>>> getArticles({String? topic}) async {
    final String key = dotenv.get("API_KEY");

    try {
      final response = await service.getNewsArticles(
        apiKey: key,
        q: topic ?? "news",
      );

      if (response.response.statusCode == HttpStatus.ok) {
        return DataSuccess(response.data.articles ?? []);
      } else {
        return DataFailed(
          DioException(
            error: response.response.statusMessage,
            response: response.response,
            type: DioExceptionType.badResponse,
            requestOptions: response.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
