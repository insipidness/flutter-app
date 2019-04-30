import 'package:flutter/material.dart';
import './routes.dart';
import 'package:flutter/rendering.dart';
import './page/login/page.dart';
import './routes.dart';

void main(){
  debugPaintSizeEnabled = !true;
  runApp(MyApp());
} 

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: const Color(0xFFFF5959),
      ),
      routes: getRoutes(),
      initialRoute: '/rukuyewuModel/tiaomaruku',
    );
  }
}