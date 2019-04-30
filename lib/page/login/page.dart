import 'package:fish_redux/fish_redux.dart';

import './state.dart';
import './view.dart';
import './effect.dart';
import './reducer.dart';

class LoginPage extends Page<UserState, Map<String, dynamic>> {
  LoginPage()
    : super(
      initState: initState,
      effect: buildEffect(),
      reducer: buildReducer(),
      view: loginView,
    );
}