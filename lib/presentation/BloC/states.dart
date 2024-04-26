import 'package:flutter_showcase_2/data/model/news_model.dart';

import '../../domain/interfaces/state.dart';

class InitialState extends AppState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends AppState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends AppState {
  final String errorMessage;

  ErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class EmptyState extends AppState {}

class DataState extends AppState {
  final dynamic data;

  DataState(this.data);
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
  final List<Article> articles;

  NewsLoadedState({required this.articles});
}
