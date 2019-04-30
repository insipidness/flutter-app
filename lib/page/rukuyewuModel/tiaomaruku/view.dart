import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/services.dart';

import './state.dart';
import '../../../component/tableView-component/tableView-component.dart';
import '../../../component/ButtonGroup/buttonGroup.dart';


Widget tiaomarukuView(
  TiaomarukuState state, Dispatch dispatch, ViewService viewService) {

    const platform = const MethodChannel('samples.flutter.io/battery');

    // Get battery level.
    String _batteryLevel = 'Unknown battery level.';

    //ListView的Item
    Widget buildItem(BuildContext context, int index) {
      return new Text("xhu_ww");
    }

    Future<void> _getBatteryLevel() async {
      String batteryLevel;
      try {
        final result = await platform.invokeMethod('getBatteryLevel');
        print((result as Map).cast());
        batteryLevel = 'Battery level at $result % .';
      } on PlatformException catch (e) {
        batteryLevel = "Failed to get battery level: '${e.message}'.";
      }

      _batteryLevel = batteryLevel;
    }
    return Scaffold(
      appBar: new AppBar(
        title: new Text("heheda"),
        backgroundColor: Color(0xFF4DD0E1),
      ),
      body: new Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: new Column(
          children: [
            RaisedButton(
              child: Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            Text(_batteryLevel),
          ],
          // children: <Widget>[
          //     TableViewComponent(
          //       viewState: state.viewState
          //     ).buildView(),
          //     ButtonGroupComponent(
          //       viewState: state.viewState
          //     ).buildView(),
          //     Flexible(
          //       child: new ListView.builder(itemCount: 40, itemBuilder: buildItem)
          //     )
          // ],
        ) 
      ),
    );
  }
