import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

import '../utils/tools.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _ipAddress = 'Unknown';
  var mobileData = '-1';

  var mTextFieldController = TextEditingController();

  //TODO http post 请求
  _postCheckCodeHttp(var mobile, int code) async {
    var url = Tools.check_code;
    //int a = 123456;
    await http.post(url, body: {'mobile': '$mobile', 'code': '$code'}).then(
        (response) {
      print("post方式->status: ${response.statusCode}");
      print("post方式->body: ${response.body}");
    });
    if (!mounted) return;
  }

  //TODO http get 请求
  _getCodeHttp(String mobile, String type) async {
    var url = Tools.code;
    try {
      await http.get(url + 'mobile=$mobile&type=$type').then((onValue) {
        if (onValue.statusCode == 200) {
          print('$mobile');
          print("get方式->status: ${onValue.statusCode}");
          print("get方式->body: ${onValue.body}");
        } else {
          print('Error getting: Http state ${onValue.statusCode}');
        }
      });
    } catch (exception) {
      print('Failed getting');
    }
    if (!mounted) return;
    setState(() {});
  }

  //TODO httpClient post 请求
  _postCheckCodeHttpClient(String mobile, var code) async {
    var url = Tools.check_code;
    var httpClient = new HttpClient();
    var responseBody;
    try {
      var request = await httpClient
          .postUrl(Uri.parse('${url}mobile=$mobile&code=$code'));
//      // 设置请求头
//      request.headers.set("loginSource", "IOS");
//      request.headers.set("useVersion", "3.1.0");
//      request.headers.set("isEncoded", "1");
//      request.headers.set("bundleId", "com.nongfadai.iospro");
//      // Content-Type大小写都ok
//      request.headers.set('content-type', 'application/json');
      Map jsonMap = {'mobile': '$mobile', 'code': '$code'};
      request.add(utf8.encode(json.encode(jsonMap)));
      var response = await request.close();
      responseBody = await response.transform(utf8.decoder).join();
      if (response.statusCode == 200) {
        print('请求成功');
        print(response.headers);
        print(responseBody);
      } else {
        responseBody = 'Error getting: Http state ${response.statusCode}';
        print(url + 'mobile=$mobile&type=$code');
        print('${url}mobile=$mobile&type=$code');
      }
    } catch (exception) {
      responseBody = 'Failed';
      print('Failed getting');
    }
  }

  //TODO httpClient get 请求
  _getCodeHttpClient(String mobile, String type) async {
    var responseBody;
    var url = Tools.code;
    var httpClient = new HttpClient();
    try {
      var request = await httpClient.getUrl(Uri.parse(
          '${url}mobile=$mobile&type=$type')); //'${url}mobile=$mobile&type=$type'
      var response = await request.close();
      if (response.statusCode == 200) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        responseBody = data['data'];
        //print(responseBody);
      } else {
        responseBody = 'Error getting: Http state ${response.statusCode}';
        print(url + 'mobile=$mobile&type=$type');
        print('${url}mobile=$mobile&type=$type');
        //print(responseBody);
      }
    } catch (exception) {
      responseBody = 'Failed';
      print('Failed getting');
    }
    if (!mounted) return;
    setState(() {});
  }

  //TODO dio post请求
  _postCodeDio(String mobile, var code) async{
    var url = Tools.check_code;
    var response;
//    var headers = Map<String, String>();
//    headers['loginSource'] = 'IOS';
//    headers['useVersion'] = '3.1.0';
//    headers['isEncoded'] = '1';
//    headers['bundleId'] = 'com.nongfadai.iospro';
//    headers['Content-Type'] = 'application/json';
    Dio dio = Dio();
    dio.options.baseUrl = url;
    dio.options.connectTimeout = 60000;
    dio.options.receiveTimeout = 60000;
    //dio.options.headers.addAll(headers);
    dio.options.method = 'post';
    Options option = Options(method: 'post');
    try{
      response = await dio.post(url, data: {'mobile': mobile, 'code': code}, options: option);
      if(response.statusCode == 200){
        print(dio.options.baseUrl);
        print('请求成功');
      }else {
        print(url + 'mobile=$mobile&type=$code');
        print('${url}mobile=$mobile&type=$code');
      }
    }catch(exception){
      print('Failed getting');
      print(dio.options.baseUrl);
      print(url);
      //print(response.data.toString());
    }

  }

  //TODO http post 请求
  _postPwdLoginHttp(var mobile, int code) async {
    var url = Tools.password_login;
    //int a = 123456;
    await http.post(url, body: {'mobile': '$mobile', 'code': '$code'}).then(
            (response) {
          print("post方式->status: ${response.statusCode}");
          print("post方式->body: ${response.body}");
        });
    if (!mounted) return;
  }

  //TODO http post 请求
  _postRefreshTokenHttp() async {
    var url = Tools.refresh_token;
    //int a = 123456;
    await http.post(url).then(
            (response) {
          print("post方式->status: ${response.statusCode}");
          print("post方式->body: ${response.body}");
        });
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(height: 100.0);
    //_getMobileData('${mTextFieldController.text}', 'register');
    //login();

    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Your current IP address is:'),
            new Text('$_ipAddress.'),
            spacer,
            new FlatButton(
              //onPressed: _getIPAddress,
              child: new Text('Get IP address'),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: 300,
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
            Container(
              margin: EdgeInsets.all(10),
              width: 300,
              height: 45,
              //color: Colors.grey,
              child: MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                child: new Text('点我'),
                onPressed: () {
                  //_getCodeHttp('${mTextFieldController.text}', 'register');//ok
                  //_getCodeHttpClient('${mTextFieldController.text}', 'register');//ok
                  //_postCheckCodeHttpClient(mTextFieldController.text, 123456);//ok
                  //_postCheckCodeHttp(mTextFieldController.text, 123456);//ok
                  //_postCodeDio(mTextFieldController.text, 123456);//not ok
                  //_postPwdLoginHttp(mTextFieldController.text, 123456);
                  _postRefreshTokenHttp();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
