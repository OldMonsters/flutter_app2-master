import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app2/study_2/NewsWebPage.dart';
import 'dart:ui';
import 'dart:convert';

import 'package:flutter_app2/utils/HttpUtils.dart';
import '../new_task_n.dart';
import 'BottomLine.dart';
import 'HomeAppBar.dart';
import 'HomeFirstTab.dart';

void main() => runApp(new HomeFragment());

class HomeFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeFragmentState();
  }
}

class HomeFragmentState extends State<HomeFragment>
    with SingleTickerProviderStateMixin {
  bool isVisable = false;

  var _controller;

  String name = 'LOL';

  _getMessage(int msg) {
    name = msg.toString() + '上王者吗';
    print('test');
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getHttp();
    HttpUtils.getHttp(
        url: 'http://www.baidu.com',
        onCallBack: (value) {
          json.decode(value);
          //classname 对象 = classname.fromJson(json.decode(value));
          //print(对象.resobj[0].liveImg);
          print('test2');
        });
    _controller = new TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.pink),
      home: Scaffold(
          appBar: HomeAppBar(_getMessage(3)),
          body: Column(
            children: <Widget>[
              HomeFirstTab(_controller),
              BottomLine(),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    new ListView(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              child: Image.asset('images/3.jpg',
                                  fit: BoxFit.cover, height: 120, width: 450)),
                        ),
                        SizedBox(
                          height: 135,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        NewTaskPage(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            child: Image.asset(
                                              'images/生产@2x.jpg',
                                              width: 35,
                                              height: 27,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text(name),
                                          margin: EdgeInsets.only(top: 5),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          child: Image.asset(
                                            'images/生产@2x.jpg',
                                            width: 35,
                                            height: 27,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Container(
                                          child: Text('绝地求生'),
                                          margin: EdgeInsets.only(top: 5),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          child: Image.asset(
                                            'images/生产@2x.jpg',
                                            width: 35,
                                            height: 27,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Container(
                                          child: Text('视频ma'),
                                          margin: EdgeInsets.only(top: 5),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          child: Image.asset(
                                            'images/生产@2x.jpg',
                                            width: 35,
                                            height: 27,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Container(
                                          child: Text('第五人格'),
                                          margin: EdgeInsets.only(top: 5),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          child: Image.asset(
                                            'images/生产@2x.jpg',
                                            width: 35,
                                            height: 27,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Container(
                                          child: Text('精灵宝可梦'),
                                          margin: EdgeInsets.only(top: 5),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: 2,
                          ),
                        ),
                        new Divider(),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  '我的关注',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 5, 5, 5),
                                child: Text(
                                  '15小时前',
                                  style: TextStyle(color: Colors.black38),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 5, 5),
                                child: Text('somebody'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 5, bottom: 5, right: 15),
                                child: Text(
                                  '直播了莎莎',
                                  style: TextStyle(color: Colors.black38),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.black45,
                              )
                            ],
                          ),
                        ),
                        new Divider(),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          //height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('推荐直播'),
                              Row(
                                children: <Widget>[
                                  Text('换一换',
                                      style: TextStyle(color: Colors.black38)),
                                  Icon(
                                    Icons.refresh,
                                    size: 16,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 460,
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 1.3),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: 15, right: 10, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
//                        Padding(
//                          padding: EdgeInsets.all(1),
//                          child: Stack(
//                            alignment: Alignment.bottomCenter,
//                            children: <Widget>[
//                              ClipRRect(
//                                  borderRadius:
//                                      BorderRadius.all(Radius.circular(10)),
//                                  child: Image.asset('images/3.jpg',
//                                      fit: BoxFit.cover,
//                                      height: 90,
//                                      width: 150)),
//                              Container(
//                                padding: EdgeInsets.fromLTRB(10, 0, 10, 2),
//                                child: Row(
//                                  mainAxisAlignment:
//                                      MainAxisAlignment.spaceBetween,
//                                  children: <Widget>[
//                                    Text('老室',
//                                        style: TextStyle(
//                                            color: Colors.white, fontSize: 12)),
//                                    Row(
//                                      children: <Widget>[
//                                        Icon(Icons.account_circle,
//                                            color: Colors.white, size: 12),
//                                        Text('8.5万',
//                                            style: TextStyle(
//                                                color: Colors.white,
//                                                fontSize: 12))
//                                      ],
//                                    )
//                                  ],
//                                ),
//                              )
//                            ],
//                          ),
//                        ),
                                    Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: <Widget>[
                                        ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            child: Image.asset('images/3.jpg',
                                                fit: BoxFit.cover,
                                                height: 90,
                                                width: 150)),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 0, 10, 2),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text('老室',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12)),
                                              Row(
                                                children: <Widget>[
                                                  Icon(Icons.account_circle,
                                                      color: Colors.black,
                                                      size: 12),
                                                  Text('8.5万',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12))
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Text('飞虎II'),
                                    Text(
                                      '还有other games',
                                      style: TextStyle(
                                          color: Colors.black38, fontSize: 12),
                                    )
                                  ],
                                ),
                              );
                            },
                            itemCount: 6,
                          ),
                        )
                      ],
                    ),
                    Icon(Icons.add),
                    //NewsWebPage('http://www.baidu.com'),
                    Icon(Icons.add),
                    Icon(Icons.add),
                    Icon(Icons.add),
                  ],
                  controller: _controller,
                ),
              )
              //第二行TabBarView
            ],
          )),
    );
  }
}
