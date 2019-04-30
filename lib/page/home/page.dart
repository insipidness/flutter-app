import 'package:fish_redux/fish_redux.dart';

import './state.dart';
import './view.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>> {
  HomePage()
    : super(
      initState: initState,
      view: homeView,
    );
}