import 'package:fish_redux/fish_redux.dart';

import './model.dart';

class TiaomarukuState implements Cloneable<TiaomarukuState> {
  String username;
  String token;
  dynamic viewState;
  dynamic groupState;

  @override
  TiaomarukuState clone() {
    return TiaomarukuState()
      ..username = username
      ..token = token
      ..viewState = rukuyewuModel;
  }
}

TiaomarukuState initState(Map<String, dynamic> args) {
  return TiaomarukuState().clone();
}