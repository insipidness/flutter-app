import 'package:flutter/material.dart';
import './page/login/page.dart';
import './page/home/page.dart';
import './page/rukuyewuModel/tiaomaruku/page.dart';

Map<String, WidgetBuilder > getRoutes() {
  return {
    // '/':           (BuildContext context) => LoginPage().buildPage(<String, dynamic>{}),
    '/':           (BuildContext context) => TiaomarukuPage().buildPage(<String, dynamic>{}),
    '/login':      (BuildContext context) => LoginPage().buildPage(<String, dynamic>{}),
    '/home':       (BuildContext context) => HomePage().buildPage(<String, dynamic>{}),
    '/rukuyewuModel/tiaomaruku': (BuildContext context) => TiaomarukuPage().buildPage(<String, dynamic>{}),
  };
}