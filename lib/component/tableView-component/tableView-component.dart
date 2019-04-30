import 'package:flutter/material.dart';

class TableViewComponent{
  final dynamic viewState;
  TableViewComponent({
    this.viewState,
  });
  buildView(){
    return buildColumnView();
  }
  Column buildColumnView(){
    List<Widget> colunmList = <Widget>[];
    List<Widget> rowList    = <Widget>[];
    var _tableView = viewState["tableView"];
    for (var i = 0; i < _tableView.length; i++) {
      var _row = _tableView[i]["column"]["row"];
      for (var j = 0; j < _row.length; j++) {
        if (_row[j]["type"] == 'lable'){
          rowList.add(Text(
            _row[j]["name"]
          ));
        } else if (_row[j]["type"] == 'input'){
          rowList.add(
            new Flexible(
              child: new TextField(
                enabled: _row[j]["enabled"],
              )
            )
          );
        } else if (_row[j]["type"] == 'icon'){
          rowList.add(
            new Icon(_row[j]["value"]),
          );
        }
      }
      colunmList.add(
        Row(
          children: rowList
        )
      );
      rowList = <Widget>[];
    }
    return new Column(
      children: colunmList
    );
  }
}