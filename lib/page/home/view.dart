import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';

import './state.dart';


Widget homeView(
  HomeState state, Dispatch dispatch, ViewService viewService) {
    var screenHeight = MediaQuery.of(viewService.context).size.height;

    /** 构建条码入库view colunm页面 */
    Column buildTmrkView(IconData icon, String label){
      return new Column(
        children: <Widget>[
          Icon(
            icon, color: Colors.red,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          )
        ]
      );
    }

    return Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            height: screenHeight,
            decoration: new BoxDecoration(
              color: Colors.blue,
              gradient: new LinearGradient(
              begin: const FractionalOffset(0.0, -1.0),
              end: const FractionalOffset(0.0, 1.0),
              colors: <Color>[Color(0xFF00838F), Color(0xFF4DD0E1), Color(0xFFFFFF)],
              ),
            ),
            child: new ListView(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
              children: <Widget>[
                Container(
                  height: 100.0,
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: new Container(
                          child: new Text(
                            "标题",
                            style: new TextStyle(
                              fontSize: 16.0
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: new Row(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            InkWell(
                              onTap: (){ 
                                Navigator.of(viewService.context).pushNamed('/rukuyewuModel/tiaomaruku');  
                              },
                              child: buildTmrkView(Icons.call,'ssss1'),
                            ),
                            Spacer(),
                            buildTmrkView(Icons.call,'aaaa2'),
                            Spacer(),
                            buildTmrkView(Icons.call,'zzzz3'),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                            Spacer(),
                          ],
                        )
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100.0,
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),  
                  child: new Text(
                    'hhhhhhhhhhhhh'
                  ),
                )
              ],
            ),
          ),
        ],
       )
    );
  }