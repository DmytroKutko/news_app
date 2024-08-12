import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'article.dart';

class NewsResponse {
  String? status;
  int? totalResults;
  List<ArticleModel>? articles;

  NewsResponse({
    this.status,
    this.totalResults,
    this.articles,
  });

  NewsResponse copyWith({
    ValueGetter<String?>? status,
    ValueGetter<int?>? totalResults,
    ValueGetter<List<ArticleModel>?>? articles,
  }) {
    return NewsResponse(
      status: status != null ? status() : this.status,
      totalResults: totalResults != null ? totalResults() : this.totalResults,
      articles: articles != null ? articles() : this.articles,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles?.map((x) => x.toMap()).toList(),
    };
  }

  factory NewsResponse.fromMap(Map<String, dynamic> map) {
    return NewsResponse(
      status: map['status'],
      totalResults: map['totalResults']?.toInt(),
      articles: map['articles'] != null
          ? List<ArticleModel>.from(
              map['articles']?.map((x) => ArticleModel.fromMap(x)))
          : null,
    );
  }

  // This method should accept a Map<String, dynamic> instead of String
  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse.fromMap(json);
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'NewsResponse(status: $status, totalResults: $totalResults, articles: $articles)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewsResponse &&
        other.status == status &&
        other.totalResults == totalResults &&
        listEquals(other.articles, articles);
  }

  @override
  int get hashCode =>
      status.hashCode ^ totalResults.hashCode ^ articles.hashCode;
}
