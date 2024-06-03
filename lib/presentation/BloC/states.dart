import 'package:flutter_showcase_2/data/model/news_model.dart';

import '../../domain/entities/state.dart';

class InitialState extends AppState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends AppState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends AppState {
  ErrorState(this.errorMessage);
  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}

class EmptyState extends AppState {}

class DataState extends AppState {
  DataState(this.data);
  final dynamic data;
}

class AuthenticatedState extends AppState {
  @override
  List<Object?> get props => [];
}

class UnAuthenticatedState extends AppState {
  @override
  List<Object?> get props => [];
}

class NewsLoadedState extends AppState {
  NewsLoadedState({
    required this.articles,
    required this.sortedArticles,
  });
  final List<Article> articles;
  final List<Article> sortedArticles;
  @override
  List<Object?> get props => [];
}

class RegistrethenState extends AppState {
  @override
  List<Object?> get props => [];
}
