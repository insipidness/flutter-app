import 'package:fish_redux/fish_redux.dart';

class HomeState implements Cloneable<HomeState> {
  String username;
  String token;

  @override
  HomeState clone() {
    return HomeState()
      ..username = username
      ..token = token;
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState();
}