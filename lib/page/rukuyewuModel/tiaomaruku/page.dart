import 'package:fish_redux/fish_redux.dart';

import './state.dart';
import './view.dart';

class TiaomarukuPage extends Page<TiaomarukuState, Map<String, dynamic>> {
  TiaomarukuPage()
    : super(
      initState: initState,
      view: tiaomarukuView,
    );
}