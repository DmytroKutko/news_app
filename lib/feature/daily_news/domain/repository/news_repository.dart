import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/feature/daily_news/domain/entity/article.dart';

abstract class NewsRepository {
  Future<DataState<List<Article>>> getArticles({String? topic});
}
