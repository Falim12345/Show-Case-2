import 'package:flutter_showcase_2/domain/interfaces/event.dart';

class SignInRequested extends Event {
  //This event will get triggered when the user requests to register the account. It takes two string parameters. email and password.
  final String email;
  final String password;

  SignInRequested(this.email, this.password);
  @override
  List<Object?> get props => [];
}

class SignUpRequested extends Event {
  //It will get fired when the user tries to log in with an email and password.

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
