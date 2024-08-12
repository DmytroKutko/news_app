import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/feature/daily_news/domain/entity/article.dart';
import 'package:news_app/feature/daily_news/domain/repository/news_repository.dart';

class GetNewsUsecase implements UseCase<DataState<List<Article>>, void> {
  final NewsRepository repository;

  GetNewsUsecase(this.repository);

  @override
  Future<DataState<List<Article>>> call({params}) {
    return repository.getArticles();
  }
}
