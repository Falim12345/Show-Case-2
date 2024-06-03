import 'package:flutter_showcase_2/domain/entities/event.dart';

class SignInRequested extends Event {
  SignInRequested(this.email, this.password);
  final String email;
  final String password;
  @override
  List<Object?> get props => [];
}

class SignUpRequested extends Event {
  SignUpRequested({required this.email, required this.password});
  final String email;
  final String password;
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
  FetchNewsEvent({required this.country});
  final String country;
}
