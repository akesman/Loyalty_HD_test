part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {}

class InitialUserState extends AuthState {
  final String error;

  InitialUserState({this.error = ""});

  @override
  List<Object> get props => [error];
}

class UserLogInState extends AuthState {
  @override
  List<Object> get props => [];
}

class UserLoadedState extends AuthState {
  final LoyaltyUser currentUser;

  UserLoadedState(this.currentUser);

  @override
  List<Object> get props => [currentUser];
}

class UserLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class UserStateErrorState extends AuthState {
  @override
  List<Object> get props => [];
}
