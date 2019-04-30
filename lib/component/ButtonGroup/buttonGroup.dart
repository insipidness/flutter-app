import 'package:flutter/material.dart';

class ButtonGroupComponent{
  final dynamic viewState;
  ButtonGroupComponent({
    this.viewState,
  });
  buildView(){
    return buildColumnView();
  }
  Column buildColumnView(){
    var _tableView = viewState["groupView"];
    List<Widget> childList    = <Widget>[];
    for (var i = 0; i < _tableView.length; i++) {
      childList.add(
        Expanded(
          child: new Padding(
              padding: const EdgeInsets.all(10),
              child: new RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                onPressed: (){
                  print("AAAAA");
                },
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: new Icon(
                        _tableView[i]["icon"]
                      ),
                    ),
                    Text(
                      _tableView[i]["label"]
                    )
                  ],
                ),
                color: Color(0xFF4DD0E1),
                textColor: Colors.white,
              ),
          ),
        )
      );
    }
    return new Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: childList
        )
      ],
    );
  }
}