import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:leschat/domain/usecases/auth/forgot_password_usecase.dart';
import 'package:leschat/domain/usecases/auth/get_current_user_usecase.dart';
import 'package:leschat/domain/usecases/auth/is_signed_in_usecase.dart';
import 'package:leschat/domain/usecases/auth/sign_out_usecase.dart';
import 'package:leschat/domain/usecases/auth/sign_up_usecase.dart';
import 'package:leschat/domain/usecases/auth/update_user_usecase.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/auth/sign_in_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInUsecase signInUsecase;
  final SignUpUsecase signUpUsecase;
  final ForgotPasswordUsecase forgotPasswordUsecase;
  final IsSignedInUsecase isSignedInUsecase;
  final GetCurrentUserUsecase getCurrentUserUsecase;
  final SignOutUsecase signOutUsecase;
  final UpdateUserUsecase updateUserUsecase;

  AuthCubit(
      {required this.signInUsecase,
      required this.signUpUsecase,
      required this.forgotPasswordUsecase,
      required this.isSignedInUsecase,
      required this.getCurrentUserUsecase,
      required this.signOutUsecase,
      required this.updateUserUsecase})
      : super(AuthInitial());

  Future<void> appStarted() async {
    emit(AuthInitial());
  }

  Future<void> signIn(User user) async {
    try {
      emit(LoginLoading());
      var result = await signInUsecase.signIn(user);
      result.fold(
          (failure) => emit(LoginFailure()), (success) => emit(LoginSuccess()));
    } catch (_) {
      emit(LoginFailure());
    }
  }

  Future<void> signUp(User user) async {
    try {
      emit(RegisterLoading());
      var result = await signUpUsecase.signUp(user);
      result.fold((failure) => emit(RegisterFailure()),
          (success) => emit(RegisterSuccess()));
    } catch (_) {
      emit(RegisterFailure());
    }
  }

  Future<void> signOut() async {
    try {
      await signOutUsecase.signOut().then((value) => emit(SignOutSuccess()));
    } catch (err) {
      emit(SignOutFailure());
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      await forgotPasswordUsecase.forgotPassword(email);
    } catch (err) {}
  }
}
