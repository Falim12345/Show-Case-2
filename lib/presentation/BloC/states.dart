import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/interfaces/state.dart';

class InitialState extends AppState {}

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

class AuthenticatedState extends AppState {
  final UserCredential userCredential;

  AuthenticatedState(this.userCredential);
}
