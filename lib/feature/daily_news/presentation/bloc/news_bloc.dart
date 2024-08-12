import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/feature/daily_news/domain/entity/article.dart';
import 'package:news_app/feature/daily_news/domain/usecases/get_news_usecase.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsUsecase getNewsUsecase;

  NewsBloc(this.getNewsUsecase) : super(NewsInitial()) {
    on<NewsInitialEvent>(newsInitialEvent);
  }

  FutureOr<void> newsInitialEvent(
      NewsInitialEvent event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    final result = await getNewsUsecase();
    if (result is DataSuccess && result.data!.isNotEmpty) {
      emit(
        NewsSuccess(articles: result.data!),
      );
    } else {
      emit(
        NewsError(
          message: result.exception?.message ?? "error loading list",
        ),
      );
    }
  }
}
