part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitialState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {}

final class RegisterFailureState extends RegisterState {
  final String e;

  RegisterFailureState({required this.e});
}

final class RegisterLoadingState extends RegisterState {}
