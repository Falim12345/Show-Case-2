import 'package:flutter_showcase_2/domain/interfaces/event.dart';

class SignInRequested extends Event {
  final String email;
  final String password;

  SignInRequested(this.email, this.password);
  @override
  List<Object?> get props => [];
}

class SignUpRequested extends Event {
  final String email;
  final String password;

  SignUpRequested({required this.email, required this.password});
  @override
  List<Object?> get props => [];
}

class GoogleSignInRequested extends Event {
  @override
  List<Object?> get props => [];
}

class FacebookSignInRequested extends Event {
  @override
  List<Object?> get props => [];
}

class SignOutRequested extends Event {
  //When the user tries to log out from the system.
}

class FetchNewsEvent extends Event {
  final String country;

  FetchNewsEvent({required this.country});
}
