part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFailure extends AuthState {}

class LoginLoading extends AuthState {}

class SignOutSuccess extends AuthState {}

class SignOutFailure extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterFailure extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterSignOut extends AuthState {}
