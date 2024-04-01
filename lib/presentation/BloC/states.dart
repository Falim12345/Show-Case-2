import '../../domain/interfaces/state.dart';

class LoadingState extends AppState {}

class ErrorState extends AppState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}

class EmptyState extends AppState {}

class DataState extends AppState {
  final dynamic data;

  DataState(this.data);
}
