
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/DetailPage.dart';

routePageBuilder(BuildContext context , String title){
  
  //导航的具体页面
  Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context , _ , __){
        return new DetailPage(
          feedType: title,
          showTitle: true,
        );
      },
  //页面跳转的补间动画
      transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
        return new FadeTransition(
          opacity: animation ,
          child: new FadeTransition(
            opacity: new Tween<double>(begin: 0.5, end: 1.0).animate(animation),
            child: child,
          ),
        );
      }
  ));
  
  

}
