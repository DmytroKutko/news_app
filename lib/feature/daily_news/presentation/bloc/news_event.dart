part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}

class NewsInitialEvent extends NewsEvent {}
