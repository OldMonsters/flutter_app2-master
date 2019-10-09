import 'package:flutter/material.dart';

import 'bilibili/BottomLine.dart';

void main() => runApp(new NewTaskPage());

//发起流程
class NewTaskPage extends StatefulWidget {
  @override
  createState() => new NewTaskPageState();
}

class NewTaskPageState extends State<NewTaskPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: '发起流程',
        theme: new ThemeData(
          primaryColor: Colors.white,
        ),
        home: new Scaffold(
            appBar: new AppBar(
              elevation: 0,
              //backgroundColor: Color(0xfff0f0f0),
              //leading: Icon(Icons.arrow_back),
              title:
                  Text('发起流程', style: new TextStyle(color: Color(0xff333333))),
              centerTitle: true,
              leading: new IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color(0xffdccf97),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            body: new ListView(
              children: <Widget>[
                Column(
                  //mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    new Container(
                      //height: 80,
                      padding: const EdgeInsets.fromLTRB(19, 16, 0, 12),
                      //color: Colors.black12,
                      color: Color(0xfff0f0f0),
                      child: Text('应用名字',
                          style: new TextStyle(
                            fontSize: 18,
                            color: Color(0xff484848),
                            //backgroundColor: Colors.black12
                          )),
                    ),
                    //new Divider(),
                    BottomLine(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 48,
                          width: 24,
                          //color: Colors.red,
                          margin: EdgeInsets.fromLTRB(24, 0, 10, 0),
                          child: //Icon(Icons.zoom_in, color: Colors.orange, size: 24),
                              Image.asset(
                            'images/生产@2x.jpg',
                            width: 26,
                            height: 26,
                          ),
                        ),
                        Text('设备查询', style: new TextStyle(fontSize: 15)),
                      ],
                    ),
                    BottomLine(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 48,
                          width: 24,
                          //color: Colors.red,
                          margin: EdgeInsets.fromLTRB(24, 0, 10, 0),
                          child: //Icon(Icons.zoom_in, color: Colors.orange, size: 24),
                              Image.asset(
                            'images/咨询@2x.png',
                            width: 26,
                            height: 26,
                          ),
                        ),
                        Text('报销申请', style: new TextStyle(fontSize: 15)),
                      ],
                    ),
                    BottomLine(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 48,
                          width: 24,
                          //color: Colors.red,
                          margin: EdgeInsets.fromLTRB(24, 0, 10, 0),
                          child: //Icon(Icons.zoom_in, color: Colors.orange, size: 24),
                              Image.asset(
                            'images/流程@2x.jpg',
                            width: 26,
                            height: 26,
                          ),
                        ),
                        Text('销售订单管理', style: new TextStyle(fontSize: 15)),
                      ],
                    ),
                    //new Divider(),
                    BottomLine(),
                    new Container(
                      //height: 80,
                      padding: const EdgeInsets.fromLTRB(19, 16, 0, 12),
                      //color: Colors.black12,
                      color: Color(0xfff0f0f0),
                      child: Text('应用名字',
                          style: new TextStyle(
                            fontSize: 18,
                            color: Color(0xff484848),
                            //backgroundColor: Colors.black12
                          )),
                    ),
                    //new Divider(),
                    BottomLine(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 48,
                          width: 24,
                          //color: Colors.red,
                          margin: EdgeInsets.fromLTRB(24, 0, 10, 0),
                          child: //Icon(Icons.zoom_in, color: Colors.orange, size: 24),
                              Image.asset(
                            'images/生产@2x.jpg',
                            width: 26,
                            height: 26,
                          ),
                        ),
                        Text('设备查询', style: new TextStyle(fontSize: 15)),
                      ],
                    ),
                  ],
                ),
              ],
            )));
  }
}
