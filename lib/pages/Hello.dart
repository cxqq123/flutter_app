import 'package:flutter/material.dart';

//通常会创建新的widget，这些widget是无状态的StatelessWidget或者是有状态的StatefulWidget
class MyAppBar extends StatelessWidget{
  // Widget子类中的字段往往都会定义为"final"
  final Widget title;

  MyAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return new Container(
      // 单位是逻辑上的像素（并非真实的像素，类似于浏览器中的像素）
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.red[500]),
      // Row 是水平方向的线性布局（linear layout）,Column 是垂直方向的线性布局
      child: new Row(
        children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu),
              tooltip: 'Navigation Menu',
              onPressed: null),
          new Expanded(
              child: new Center(
                child: title,
              )),
          new IconButton(
              icon: new Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null)
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
              child: new Center(
                child: new Text("Hello,World"),
            ),
          )
        ],
      ),
    );
  }

}

void main(){
  runApp(
    new MaterialApp(
      title: 'My app',
      home: new MyScaffold(),
    )
  );
}

