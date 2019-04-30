import 'package:flutter/material.dart';
import 'package:fish_redux/fish_redux.dart';

import './state.dart';
import './action.dart';
import './login_component/LoginBannerComponent.dart';

Widget loginView(UserState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: new ListView(
      children: <Widget>[
        new Container(
          child: new Stack(
            alignment: Alignment(1.0, 1.0),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: LoginBannerComponent(""),
              ),
            ],
          ),
        ),
        new Container(
          child: new Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,0,20.0,0),
                child: new TextFormField(
                  // keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: '工号',
                    hintText: '请输入工号',
                    icon: Icon(Icons.account_circle)
                  ),
                  controller: state.usernameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0,0,20.0,0),
                child: new TextFormField(
                  decoration: new InputDecoration(
                    labelText: '密码',
                    hintText: '请输入密码',
                    icon: Icon(Icons.https)
                  ),
                  obscureText: true,
                  controller: state.passwordController,
                )
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ButtonTheme(
                  minWidth: double.infinity,
                  child: RaisedButton(
                    shape: StadiumBorder(),
                    onPressed: () {
                      dispatch(LoginActionCreator.loginByUserNameAction(
                          state.usernameController.text,
                          state.passwordController.text
                      ));
                      // showDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     String alertText = 'login success!';
                      //     return AlertDialog(
                      //       content: Text(alertText),
                      //     );
                      //  }
                      // );
                      // Navigator.pushNamed(context, '/home');
                    },
                    child: const Text('登录'),
                    color: Color(0xFF4DD0E1),
                    textColor: Colors.white,
                  ),
                ) 
              )
            ],
          ),
        )
      ],
    ),
  );
}