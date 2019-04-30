import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import './action.dart';
import './state.dart';
import './service.dart';
import '../../component/AlertDialog/AlertDialog.dart';
import '../../component/toast-component/toast-component.dart';

Effect<UserState> buildEffect() {
  return combineEffects(<Object, Effect<UserState>>{
    Lifecycle.initState: _init,
    LoginAction.loginByUserName: _loginByUserName
  });
}

/// 初始化监听username/password text
/// updateUserAction <String,String>
void _init(Action action, Context<UserState> ctx) {
  ctx.state.usernameController.addListener((){
    ctx.dispatch(LoginActionCreator.updateUserAction(ctx.state.usernameController.text,null));
  });
  ctx.state.passwordController.addListener((){
    ctx.dispatch(LoginActionCreator.updateUserAction(null, ctx.state.passwordController.text));
  });
}

_loginByUserName(Action action, Context<UserState> ctx) async{
  String _password = action.payload['username'];
  String _username = action.payload['password'];
  dynamic _result =  await loginByUsername(_username, _password);
  if(_result['model']['errorList'].length > 0){
    showDialog(
      context: ctx.context,
      builder: (_) => AlertDialogComponent(
        title: '接口错误提示',
        context: ctx.context,
        content: _result['model']['errorList'][0]['msg_body']
      )
    );
  }else{
     ToastComponent.show("登陆成功", ctx.context);
  }
}