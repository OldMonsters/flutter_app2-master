import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:convert';

import '../utils/tools.dart';

void main() => runApp(new HomeFragment());

class HomeFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeFragmentState();
  }
}

class HomeFragmentState extends State<HomeFragment> {
  bool isVisable = false;

  var editTextController = TextEditingController();
  var mTextFieldController = TextEditingController();
  var mTextFormFieldController = TextEditingController();

  var mobile_data = 'Unknown';

  _getToken(String mobile, {String areaCode}) async {
    var responseBody;
    var url = Tools.mobile;
    var httpClient = new HttpClient();

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == 200) {
        responseBody = await response.transform(utf8.decoder).join();
        responseBody = jsonDecode(responseBody);
        mobile = responseBody['data'];
      } else {
        print('error');
      }
    } catch (exception) {
      print('Failed getting');
    }

    setState(() {
      mobile_data = mobile;
    });
  }

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
        appBar: AppBar(
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
                child: Image.asset('images/咨询@2x.png', width: 25, height: 25),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.access_time, color: Colors.white),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: new ListView(
          children: <Widget>[
            //TODO 1.基本的输入框
            //1.EditText
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(left: 5),
              alignment: Alignment.center,
              //color: Colors.amberAccent,
              height: 30,
              width: 200,
              child: Row(
                children: <Widget>[
                  Icon(Icons.search),
                  Container(
                    padding: EdgeInsets.only(left: 8),
                    alignment: Alignment.center,
                    height: 30,
                    width: 200,
                    child: EditableText(
                      controller: editTextController,
                      focusNode: FocusNode(),
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      cursorColor: Colors.blueAccent,
                      backgroundCursorColor: Colors.blueAccent,
                      onChanged: (result) {
                        print(result);
                      }, //textInputAction: TextInputAction.emergencyCall,
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            //TODO 2.TextField
            Container(
              margin: EdgeInsets.all(10),
              width: 200,
              height: 60,
              child: TextField(
                controller: mTextFieldController,
                focusNode: FocusNode(),
                //textAlign: TextAlign.start,
                decoration: InputDecoration(
                    //icon: Icon(Icons.search, color: Colors.grey),
                    labelText: '皮卡皮卡皮',
                    labelStyle: TextStyle(color: Colors.grey),
                    helperText: 'helloworld',
                    prefixIcon: Icon(Icons.keyboard_arrow_left),
                    suffixIcon: Icon(Icons.refresh),
                    //prefixText: "test1",
                    //prefixStyle: TextStyle(inherit: true, color: Colors.grey),
                    //hintText: 'test2',
                    //contentPadding: new EdgeInsets.only(bottom: 0.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    )
                    //enabled: true,
                    ),
              ),
            ),
            //TODO 3.
            Container(
              margin: EdgeInsets.all(10),
              //padding: EdgeInsets.all(10),
              height: 60,
              width: 160,
              child: TextFormField(
                  controller: mTextFormFieldController,
                  focusNode: FocusNode(),
                  decoration: InputDecoration(
                      //icon: Icon(Icons.keyboard_arrow_left),
                      labelText: 'sdfsadfas',
                      //labelStyle: TextStyle(fontSize: 12),
                      helperText: ('精灵宝可梦'),
                      //hintText: 'how are you',
                      //hintStyle: TextStyle(fontSize: 12),
                      //contentPadding: EdgeInsets.only(bottom: 5),
                      prefixIcon: Icon(Icons.keyboard_arrow_left),
                      suffixIcon: Icon(Icons.refresh),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ))),
            ),
            //
            Container(
              margin: EdgeInsets.all(10),
              width: 200,
              height: 45,
              child: TextField(
                controller: mTextFieldController,
                focusNode: FocusNode(),
                decoration: InputDecoration(
                    labelText: '中文字高',
                    labelStyle: TextStyle(color: Colors.grey),
                    //helperText: 'wfrsdfa',
                    suffixIcon: Icon(Icons.keyboard),
                    prefixIcon: Icon(Icons.print),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
