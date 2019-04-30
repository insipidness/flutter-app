import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';

class UserState implements Cloneable<UserState> {
  String username;
  String password;
  String token;

  /// 登录名、密码 controller
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController;


  @override
  UserState clone() {
    return UserState()
      ..username = username
      ..password = password
      ..token = token
      ..usernameController = usernameController
      ..passwordController = passwordController;
  }
}

UserState initState(Map<String, dynamic> args) {
  final UserState state = UserState().clone();
  state.usernameController = TextEditingController(text: "");
  state.passwordController = TextEditingController(text: "");
  return state;
}