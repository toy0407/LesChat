import 'package:get_it/get_it.dart';
import 'package:leschat/data/datasources/local/chat_local_datasource.dart';
import 'package:leschat/data/datasources/local/chat_local_datasource_impl.dart';
import 'package:leschat/data/datasources/remote/auth_remote_datasource.dart';
import 'package:leschat/data/datasources/remote/chat_remote_datasource_impl.dart';
import 'package:leschat/data/repositories/auth_repository_impl.dart';
import 'package:leschat/data/repositories/chat_repository_impl.dart';
import 'package:leschat/domain/repositories/chat_repository.dart';
import 'package:leschat/domain/usecases/chats/get_all_chats_usecase.dart';
import 'package:leschat/domain/usecases/chats/get_user_details_usecase.dart';
import 'package:leschat/domain/usecases/chats/get_users_by_query_usecase.dart';
import 'package:leschat/domain/usecases/chats/send_message_usecase.dart';
import 'package:leschat/presentation/blocs/bloc/auth_bloc.dart';
import 'package:leschat/presentation/blocs/bloc/chat_bloc.dart';
import 'package:leschat/presentation/blocs/cubit/conversations_cubit.dart';
import '/domain/repositories/auth_repository.dart';
import '/domain/usecases/auth/forgot_password_usecase.dart';
import '/domain/usecases/auth/get_current_user_usecase.dart';
import '/domain/usecases/auth/is_signed_in_usecase.dart';
import '/domain/usecases/auth/sign_out_usecase.dart';
import '/domain/usecases/auth/sign_up_usecase.dart';
import '/domain/usecases/auth/update_user_usecase.dart';
import '/domain/usecases/auth/sign_in_usecase.dart';
import 'data/datasources/remote/auth_remote_datasource_impl.dart';
import 'data/datasources/remote/chat_remote_datasource.dart';
import 'domain/usecases/chats/get_messages_by_chatid_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory<AuthBloc>(() => AuthBloc(
      signInUsecase: sl.call(),
      signUpUsecase: sl.call(),
      forgotPasswordUsecase: sl.call(),
      isSignedInUsecase: sl.call(),
      getCurrentUserUsecase: sl.call(),
      signOutUsecase: sl.call(),
      updateUserUsecase: sl.call()));
  sl.registerFactory<ConversationsCubit>(() => ConversationsCubit(
      getAllChatsUsecase: sl.call(), getUsersByQueryUsecase: sl.call()));

  sl.registerFactory<ChatBloc>(() => ChatBloc(
      getAllChatsUsecase: sl.call(),
      getMessagesByChatIdUsecase: sl.call(),
      getUserDetailsUsecase: sl.call(),
      getUsersByQueryUsecase: sl.call(),
      sendMessageUsecase: sl.call()));

  // Usecases
  sl.registerLazySingleton<SignInUsecase>(
      () => SignInUsecase(authRepository: sl.call()));
  sl.registerLazySingleton<SignUpUsecase>(
      () => SignUpUsecase(authRepository: sl.call()));
  sl.registerLazySingleton<SignOutUsecase>(
      () => SignOutUsecase(authRepository: sl.call()));
  sl.registerLazySingleton<ForgotPasswordUsecase>(
      () => ForgotPasswordUsecase(authRepository: sl.call()));
  sl.registerLazySingleton<GetCurrentUserUsecase>(
      () => GetCurrentUserUsecase(authRepository: sl.call()));
  sl.registerLazySingleton<IsSignedInUsecase>(
      () => IsSignedInUsecase(authRepository: sl.call()));
  sl.registerLazySingleton<UpdateUserUsecase>(
      () => UpdateUserUsecase(authRepository: sl.call()));

  sl.registerLazySingleton<GetAllChatsUsecase>(
      () => GetAllChatsUsecase(chatRepository: sl.call()));
  sl.registerLazySingleton<GetUsersByQueryUsecase>(
      () => GetUsersByQueryUsecase(chatRepository: sl.call()));
  sl.registerLazySingleton<GetMessagesByChatIdUsecase>(
      () => GetMessagesByChatIdUsecase(chatRepository: sl.call()));
  sl.registerFactory<GetUserDetailsUsecase>(
      () => GetUserDetailsUsecase(chatRepository: sl.call()));
  sl.registerFactory<SendMessageUsecase>(
      () => SendMessageUsecase(chatRepository: sl.call()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDataSource: sl.call()));
  sl.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(
      chatLocalDataSource: sl.call(), chatRemoteDataSource: sl.call()));

  // Local Data Source
  sl.registerLazySingleton<ChatLocalDataSource>(
      () => ChatLocalDataSourceImpl(chatRemoteDataSource: sl.call()));

  // Remote Data Source
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());
  sl.registerLazySingleton<ChatRemoteDataSource>(
      () => ChatRemoteDataSourceImpl());

  // External
}
