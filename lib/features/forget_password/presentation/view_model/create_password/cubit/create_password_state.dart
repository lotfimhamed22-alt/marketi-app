part of 'create_password_cubit.dart';

@immutable
sealed class CreatePasswordState {}

final class CreatePasswordInitial extends CreatePasswordState {}

final class CreatePasswordLoading extends CreatePasswordState {}

final class CreatePasswordSuccess extends CreatePasswordState {}

final class CreatePasswordFailure extends CreatePasswordState {
  final String errorMessage;

  CreatePasswordFailure({required this.errorMessage});
}
