part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthSignInEvent extends AuthEvent {
  final User user;
  const AuthSignInEvent({required this.user});
}

class AuthSignOutEvent extends AuthEvent {}

class AuthSignUpEvent extends AuthEvent {
  final User user;
  const AuthSignUpEvent({required this.user});
}

class AuthIsSignedInEvent extends AuthEvent {}

class AuthGetCurrentUserEvent extends AuthEvent {}

class AuthForgotPasswordEvent extends AuthEvent {
  final String email;
  const AuthForgotPasswordEvent({required this.email});
}

class AuthUpdateUserEvent extends AuthEvent {
  final User user;
  const AuthUpdateUserEvent({required this.user});
}
