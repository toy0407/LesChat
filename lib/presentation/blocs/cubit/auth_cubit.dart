import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:leschat/core/error/failures.dart';
import 'package:leschat/domain/usecases/auth/forgot_password_usecase.dart';
import 'package:leschat/domain/usecases/auth/get_current_user_usecase.dart';
import 'package:leschat/domain/usecases/auth/is_signed_in_usecase.dart';
import 'package:leschat/domain/usecases/auth/sign_out_usecase.dart';
import 'package:leschat/domain/usecases/auth/sign_up_usecase.dart';
import 'package:leschat/domain/usecases/auth/update_user_usecase.dart';
import 'package:leschat/presentation/pages/forgot_password_page.dart';
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
    //TODO
    try {
      emit(AuthLoading());
      var result = await signInUsecase.signIn(user);
      result.fold(
          (failure) => emit(AuthFailure()), (success) => emit(AuthSuccess()));
    } catch (_) {
      emit(AuthFailure());
    }
  }

  Future<void> signOut() async {
    await signOutUsecase.signOut();
    emit(AuthSignOut());
  }
}
