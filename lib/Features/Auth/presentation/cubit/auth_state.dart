import 'package:equatable/equatable.dart';
import 'package:style_craft/Features/Auth/Domain/entities/get_profile_entity.dart';
import 'package:style_craft/Features/Auth/Domain/entities/login_entity.dart';
import 'package:style_craft/Features/Auth/Domain/entities/register_entity.dart';

abstract class AuthCubitState extends Equatable {
  const AuthCubitState();

  @override
  List<Object?> get props => [];
}

class AuthCubitInitial extends AuthCubitState {
  final String countryCode;

  const AuthCubitInitial({this.countryCode = 'EG'});

  @override
  List<Object?> get props => [countryCode];
}

class PhoneValid extends AuthCubitState {
  final String phoneNumber;

  const PhoneValid({required this.phoneNumber});

  @override
  List<Object?> get props => [phoneNumber];
}

class PhoneInvalid extends AuthCubitState {
  final String errorMessage;

  const PhoneInvalid({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class ExperienceLevelSelected extends AuthCubitState {
  final String selectedLevel;

  const ExperienceLevelSelected(this.selectedLevel);

  @override
  List<Object> get props => [selectedLevel];
}

class RegisterLoadingState extends AuthCubitState {}

class RegisterSuccessState extends AuthCubitState {
  final RegisterEntity registerEntity;

  const RegisterSuccessState({required this.registerEntity});

  @override
  List<Object?> get props => [registerEntity];
}

class RegisterErrorState extends AuthCubitState {
  final String? errorMessage;

  const RegisterErrorState(this.errorMessage);
}

class LoginLoadingState extends AuthCubitState {}

class LoginSuccessState extends AuthCubitState {
  final LoginEntity loginEntity;

  const LoginSuccessState({required this.loginEntity});

  @override
  List<Object?> get props => [loginEntity];
}

class LoginErrorState extends AuthCubitState {
  final String? errorMessage;

  const LoginErrorState(this.errorMessage);
}

class RefreshTokenLoadingState extends AuthCubitState {}

class RefreshTokenSuccessState extends AuthCubitState {}

class RefreshTokenErrorState extends AuthCubitState {
  final String errorMessage;

  const RefreshTokenErrorState(this.errorMessage);
}

class LogoutSuccessState extends AuthCubitState {
  final String message;

  const LogoutSuccessState({required this.message});
}

class LogoutErrorState extends AuthCubitState {
  final String errorMessage;

  const LogoutErrorState({required this.errorMessage});
}

class ProfileInfoLoadingState extends AuthCubitState {}

class ProfileInfoSuccessState extends AuthCubitState {
  final ProfileInfoEntity profileInfoEntity;

  const ProfileInfoSuccessState({required this.profileInfoEntity});

  @override
  List<Object?> get props => [profileInfoEntity];
}

class ProfileInfoErrorState extends AuthCubitState {
  final String? errorMessage;

  const ProfileInfoErrorState(this.errorMessage);
}
