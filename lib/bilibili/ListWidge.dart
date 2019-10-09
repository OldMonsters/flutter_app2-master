import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_app2/study_2/NewsWebPage.dart';

void main() => runApp(new HomeFragment());

class HomeFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeFragmentState();
  }
}

class HomeFragmentState extends State<HomeFragment> {
  bool isVisible = false;
  bool appbarIsVisible = true;

  var editTextController = TextEditingController();
  var mTextFieldController = TextEditingController();
  var mTextFormFieldController = TextEditingController();

  var mScrollOffsetContenner = new ScrollController(initialScrollOffset: 100);

  double downY = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.pink),
      home: Scaffold(
        appBar: appbarIsVisible
            ? AppBar(
                elevation: 0,
                title: Row(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment(1.3, -1.3),
                      children: <Widget>[
                        ClipOval(
                            child: Image.asset('images/咨询@2x.png',
                                width: 25, height: 25)),
                        Container(
                            width: 9,
                            height: 9,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white),
                            ))
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 13, right: 13),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 4),
                      width: 160,
                      height: 30,
                      //color: Colors.black26,
                      child: Icon(Icons.search, color: Colors.white),
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    Image.asset('images/生产@2x.jpg', width: 25, height: 25),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Image.asset('images/咨询@2x.png',
                          width: 25, height: 25),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(Icons.access_time, color: Colors.white),
                    ),
                  ],
                ),
                centerTitle: true,
              )
            : null,
        body: new Listener(
          onPointerDown: (downPointEvent) {
            downY = downPointEvent.position.dy;
            print('size=${downPointEvent.size}');
            print('position=${downPointEvent.position.distance}');
            print('position=${downPointEvent.position.dx}');
            print('position=${downPointEvent.position.dy}');
          },
          onPointerMove: (movePointEvent) {
            print('move=${movePointEvent.position.dx}');
            if (movePointEvent.position.dy - downY < 0) {
              if ((movePointEvent.position.dy - downY).abs() > 40) {
                setState(() {
                  appbarIsVisible = false;
                });
              }
              print('向上滑动');
            } else {
              if ((movePointEvent.position.dy - downY) > 40) {
                setState(() {
                  appbarIsVisible = true;
                });
              }
              print('向下滑动');
            }
          },
          child: new ListView(
            //scrollDirection: Axis.horizontal,
            //reverse: true,//反序
            controller: mScrollOffsetContenner,
            children: <Widget>[
              //TODO 列表部件1.
              Container(
                height: 100,
                width: 200,
                color: Colors.amberAccent,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.red,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.blueAccent,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.white70,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.black,
              ),
              Container(
                height: 100,
                width: 200,
                color: Colors.green,
              ),
              Container(
                height: 200,
                width: 200,
                color: Colors.black,
                child: GestureDetector(
                  child: ListView.builder(
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: 9,
                      itemBuilder: (count, index) {
                        return Container(
                          color: Colors.deepOrange,
                          width: 130,
                          height: 100,
                          child: Icon(Icons.access_alarm),
                        );
                      }),
                  onTap: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new NewsWebPage('http://www.baidu.com')));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
