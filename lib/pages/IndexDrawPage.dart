
import 'package:flutter/material.dart';
import 'package:flutter_app/common/GlobalConfig.dart';
import 'package:flutter_app/utils/PageRouteUtils.dart';

class IndexDrawPage extends StatelessWidget{

  String email , name , profileimg , background;

  IndexDrawPage({this.background , this.profileimg , this.name , this.email});

  @override
  Widget build(BuildContext context) {

    return new ListView(
      children: <Widget>[
        new UserAccountsDrawerHeader(
            accountName: new Text(name),
            accountEmail: new Text(email),
            //当前账户的图片
            currentAccountPicture:
            new CircleAvatar(backgroundImage: new AssetImage(profileimg)),
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage(background), fit: BoxFit.cover)),
        ),
        new ListTile(
          title: new Text("福利"),
          trailing: new Icon(Icons.whatshot , color: Colors.red),
          onTap: (){
            print("Home");
            Navigator.of(context).pop();
            routePageBuilder(context , GlobalConfig.welfare);
          },
        ),
        new ListTile(
          title: new Text("搜索"),
          trailing: new Icon(Icons.search , color: Colors.red),
          onTap: (){
            print("Notification");
            Navigator.of(context).pop();
            routePageBuilder(context , GlobalConfig.welfare);
          },
        ),
        new ListTile(
          title: new Text("历史"),
          trailing: new Icon(Icons.history , color: Colors.red),
          onTap: (){
            print("Home");
            //pop()表示退出这个页面 ,
            Navigator.of(context).pop();
            routePageBuilder(context , GlobalConfig.welfare);
          },
        ),
        new ListTile(
          title: new Text("Exit"),
          trailing: new Icon(Icons.exit_to_app , color: Colors.red),
          onTap: (){
            print("Home");
            Navigator.of(context).pop();
          },
        ),
      ],
    );

  }

}