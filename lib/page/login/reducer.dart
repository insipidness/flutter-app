import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Reducer<UserState> buildReducer() {
  return asReducer<UserState>(<Object, Reducer<UserState>>{
    LoginAction.updateUserAction: _updateUserAction,
  });
}

UserState _updateUserAction(UserState state, Action action){
  final Map<String, String> update = action.payload ?? <String, String>{};
  final UserState newState = state.clone();
  newState.username = update['username'] ?? newState.usernameController.text;
  newState.password = update['password'] ?? newState.passwordController.text;
  return newState;
}