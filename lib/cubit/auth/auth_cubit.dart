import 'package:cubit/cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:loyalty_hd/data/model/loyalty_user.dart';
import 'package:loyalty_hd/services/user_service.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  UserService? _userService;
  LoyaltyUser? _currentUser;

  static final Logger log = Logger();

  AuthCubit(BuildContext context) : super(InitialUserState()) {
    _userService = Provider.of<UserService>(context, listen: false);
  }

  Future<void> logIn(String login, String password) async {
    emit(UserLoadingState());
    await Future.delayed(Duration(milliseconds: 1));
    LoyaltyUser? loyaltyUser = await _userService?.getUser(login);
    if (loyaltyUser == null || loyaltyUser.password != password) {
      emit(InitialUserState(error: "Ошибка Входа"));
      log.v("log in error!");
    } else {
      _currentUser = loyaltyUser;
      emit(UserLoadedState(_currentUser!));
      log.v("log in success!");
    }
  }

  Future<void> logOut() async {
    emit(UserLoadingState());
    await Future.delayed(Duration(seconds: 0));
    _currentUser = null;
    emit(InitialUserState(error: "Вышли"));
  }

  Future<void> saveUser(LoyaltyUser loyaltyUser) async {
    emit(UserLoadingState());
    await Future.delayed(Duration(seconds: 0));
    await _userService?.saveUser(loyaltyUser);
    log.v("save user done! $loyaltyUser");
    emit(InitialUserState(error: "Пользователь записан!"));
  }

  @override
  void onTransition(Transition<AuthState> transition) {
    log.d(transition);
    super.onTransition(transition);
  }
}
