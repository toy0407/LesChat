import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:leschat/domain/usecases/auth/forgot_password_usecase.dart';
import 'package:leschat/domain/usecases/auth/get_current_user_usecase.dart';
import 'package:leschat/domain/usecases/auth/is_signed_in_usecase.dart';
import 'package:leschat/domain/usecases/auth/sign_in_usecase.dart';
import 'package:leschat/domain/usecases/auth/sign_out_usecase.dart';
import 'package:leschat/domain/usecases/auth/sign_up_usecase.dart';
import 'package:leschat/domain/usecases/auth/update_user_usecase.dart';

import '../../../domain/entities/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUsecase signInUsecase;
  final SignUpUsecase signUpUsecase;
  final SignOutUsecase signOutUsecase;
  final IsSignedInUsecase isSignedInUsecase;
  final ForgotPasswordUsecase forgotPasswordUsecase;
  final UpdateUserUsecase updateUserUsecase;
  final GetCurrentUserUsecase getCurrentUserUsecase;

  AuthBloc(
      {required this.forgotPasswordUsecase,
      required this.getCurrentUserUsecase,
      required this.isSignedInUsecase,
      required this.signInUsecase,
      required this.signOutUsecase,
      required this.signUpUsecase,
      required this.updateUserUsecase})
      : super(AuthInitial()) {
    on<AuthSignInEvent>(signIn);
    on<AuthSignOutEvent>(signOut);
    on<AuthSignUpEvent>(signUp);
    on<AuthUpdateUserEvent>(updateUser);
    on<AuthGetCurrentUserEvent>(getCurrentUser);
    on<AuthForgotPasswordEvent>(forgotPassword);
    on<AuthIsSignedInEvent>(isSignedIn);
  }

  FutureOr<void> signIn(AuthSignInEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoading());
    var result = await signInUsecase.signIn(event.user);
    result.fold((l) => emit(LoginFailure()), (r) => emit(LoginSuccess()));
  }

  FutureOr<void> signOut(
      AuthSignOutEvent event, Emitter<AuthState> emit) async {
    emit(SignOutLoading());
    var result = await signOutUsecase.signOut();
    result.fold((l) => emit(SignOutFailure()), (r) => emit(SignOutSuccess()));
  }

  FutureOr<void> signUp(AuthSignUpEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoading());
    var result = await signUpUsecase.signUp(event.user);
    result.fold((l) => emit(RegisterFailure()), (r) => emit(RegisterSuccess()));
  }

  FutureOr<void> updateUser(
      AuthUpdateUserEvent event, Emitter<AuthState> emit) async {
    emit(UpdateUserLoading());
    var result = await updateUserUsecase.updateUser(event.user);
    result.fold(
        (l) => emit(UpdateUserFailure()), (r) => emit(UpdateUserSuccess()));
  }

  FutureOr<void> getCurrentUser(
      AuthGetCurrentUserEvent event, Emitter<AuthState> emit) async {
    var result = await getCurrentUserUsecase.getCurrentUser();
    result.fold((l) => null, (r) => null);
  }

  FutureOr<void> forgotPassword(
      AuthForgotPasswordEvent event, Emitter<AuthState> emit) async {
    var result = await forgotPasswordUsecase.forgotPassword(event.email);
    result.fold((l) => null, (r) => null);
  }

  FutureOr<void> isSignedIn(
      AuthIsSignedInEvent event, Emitter<AuthState> emit) async {
    var result = await isSignedInUsecase.isSignedIn();
    print(result);
    result.fold((l) => emit(LoginFailure()), (r) {
      if (r == false)
        emit(LoginFailure());
      else
        emit(LoginSuccess());
    });
  }
}
