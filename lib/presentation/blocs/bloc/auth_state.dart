part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {}

final class RegisterFailure extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginFailure extends AuthState {}

final class LoginLoading extends AuthState {}

final class SignOutSuccess extends AuthState {}

final class SignOutFailure extends AuthState {}

final class SignOutLoading extends AuthState {}

final class UpdateUserSuccess extends AuthState {}

final class UpdateUserFailure extends AuthState {}

final class UpdateUserLoading extends AuthState {}

final class getCurrentUserSuccess extends AuthState {
  final User user;
  const getCurrentUserSuccess({required this.user});
}

final class getCurrentUserFailure extends AuthState {}

final class getCurrentUserLoading extends AuthState {}
