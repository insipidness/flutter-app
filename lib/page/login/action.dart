import 'package:fish_redux/fish_redux.dart';

enum LoginAction {
  loginByUserName,
  updateUserAction
}

class LoginActionCreator {
  /// 用户登录
  /// [effect]
  static Action loginByUserNameAction(String username, String password){
    return Action(
      LoginAction.loginByUserName,
      payload: <String, String>{'username':username, 'password':password}
    );
  }

  /// 更改用户名/密码
  /// [reducer]
  static Action updateUserAction(String username, String password){
    return Action(
      LoginAction.updateUserAction,
      payload: <String, String>{'username': username, 'password': password}
    );
  }
}