import 'package:flutter/material.dart';

/// DialogComponent 组件
/// [title]   @required 弹窗标题
/// [content] @required 弹窗内容
/// [actions] 确定 >>> Navigator.of(context).pop() 关闭当前页面
/// 单按钮确认弹窗

class AlertDialogComponent extends StatelessWidget {
  final BuildContext context;
  final String title;
  final String content;
  AlertDialogComponent({
    Key key,
    @required this.context,
    @required this.title,
    @required this.content
  }) : assert(context != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    //show();
    return AlertDialog(
          title: new Text(
            this.title,
            style: new TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600
            ),
          ),
          content: Container(
            child: Row(
              children: <Widget>[
                Text(
                  content,
                  style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.black54
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
                child: new Text(
                  '确定',
                  style: new TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                    Navigator.of(context).pop();
                },
                textColor: Color(0xFF4DD0E1),
            ),
          ]
        );
  }
}

