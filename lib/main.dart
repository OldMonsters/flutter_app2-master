import 'package:flutter/material.dart';
//import 'package:english_words/english_words.dart';
import './study_2/firstPage.dart';
import './study_2/secondPage.dart';
import './study_2/thirdPage.dart';
import 'change_pwd_page_n.dart';
import 'new_task_n.dart';
import 'study_lake.dart';
import 'package:flutter_app2/bilibili/HomeFragment.dart';

//void main() => runApp(new MyApp());
//void main() => runApp(new NewTaskPage());
//void main() => runApp(new Study_lake());
void main() => runApp(HomeFragment());

class MyApp extends StatefulWidget {
  @override
  createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  //with SingleTickerProviderStateMixin {
  //TabController controller;

//  @override
//  void initState() {
//    controller = new TabController(length: 3, vsync: this);
//  }

//  void dispose() {
//    controller.dispose();
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new Scaffold(
//      body: new TabBarView(
//          controller: controller,
//          children: <Widget>[
//            new FirstPage(),
//            //new SecondPage(),
//            //new ThirdPage()
//          ]
//      ),
            appBar: new AppBar(
              title: new Text('data'),
            ),
            body: new Center(
              child: new Text('aaa'),
            )));
//        bottomNavigationBar: new Material(
//          color: Colors.orangeAccent,
//          child: new TabBar(
//            controller: controller,
//            tabs: <Tab>[
//              new Tab(text: '列表', icon: new Icon(Icons.home)),
//              new Tab(text: '通知', icon: new Icon(Icons.message)),
//              new Tab(text: '我的', icon: new Icon(Icons.cloud)),
//            ],
//          ),
//        ));
  }
}
