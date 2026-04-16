part of 'password_code_cubit.dart';

@immutable
sealed class PasswordCodeState {}

final class PasswordCodeInitial extends PasswordCodeState {}

final class PasswordCodeLoding extends PasswordCodeState {}

final class PasswordCodeSuccess extends PasswordCodeState {}

final class PasswordCodeFailure extends PasswordCodeState {
  final String errorMessage;

  PasswordCodeFailure({required this.errorMessage});
}
