part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class GetProfileDataLoading extends ProfileState {}

final class GetProfileDataSuccess extends ProfileState {}

final class GetProfileDataError extends ProfileState {
  final String message;

  GetProfileDataError({required this.message});
  
}
