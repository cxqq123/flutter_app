

import 'package:flutter/material.dart';
import 'package:flutter_app/common/GlobalConfig.dart';

class ApplicationPageState extends State<ApplicationPage>
  with SingleTickerProviderStateMixin{

  int page = 0;
  String title = GlobalConfig.homeTab;
  PageController pageController;

  //定义底部导航项目 定义一个数组
  final List<BottomNavigationBarItem> bottomTabs = <BottomNavigationBarItem>[

      new BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text(GlobalConfig.homeTab),
          backgroundColor: GlobalConfig.colorPrimary
      ),
      new BottomNavigationBarItem(
          icon: Icon(Icons.tune),
          title: Text(GlobalConfig.classyTab),
          backgroundColor: GlobalConfig.colorPrimary
      ),
      new BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text(GlobalConfig.mineTab),
          backgroundColor: GlobalConfig.colorPrimary
      ),
  ];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        theme: new ThemeData(primaryColor: GlobalConfig.colorPrimary),
        home: Scaffold(
          appBar: new AppBar(
            title: new Text(title),
          ),
          drawer: new Drawer(
//            child: new IndexDrawPage(
//
//            ),
          ),
        )
    );
  }

}

class ApplicationPage extends StatefulWidget{
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return ApplicationPageState();
//  }

  @override
  State<StatefulWidget> createState() => ApplicationPageState();
}
