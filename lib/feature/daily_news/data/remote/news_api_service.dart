import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/feature/daily_news/data/models/news_response.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  @GET("/v2/everything")
  Future<HttpResponse<NewsResponse>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("q") String? q,
    @Query("language") String? language,
  });
}
