import 'package:equatable/equatable.dart';

// Events
abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginSubmitted extends AuthEvent {
  final String email;
  final String password;

  LoginSubmitted({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}


class SignUpSubmitted extends AuthEvent {
  final String name;
  final String email;
  final String password;

  SignUpSubmitted({
    required this.name,
    required this.email,
    required this.password,
  });
}

class GoogleSignInRequested extends AuthEvent {}

