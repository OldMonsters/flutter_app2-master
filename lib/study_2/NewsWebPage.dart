import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

//void main() => runApp(NewsWebPage('http://www.baidu.com'));

class NewsWebPage extends StatefulWidget {
  String news_url;

  NewsWebPage(this.news_url);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new NewsWebPageState(news_url);
  }
}

class NewsWebPageState extends State<NewsWebPage> {
  String news_url;
  //标记是否加载中
  bool loading = true;
  //标记当前页面是否是我们自定义的回调页面
  bool isLoadingCallbackPage = false;

  NewsWebPageState(this.news_url);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      routes: {
        '/': (_) => new WebviewScaffold(
              url: 'http://www.baidu.com',
              appBar: AppBar(
                title: Text('test'),
              ),
            )
      },
//      home: new WebviewScaffold(
//        url: news_url,
//        appBar: AppBar(
//          title: Text('test'),
//        ),
//        withZoom: true, //允许网页缩放
//        withLocalStorage: true, //
//        withJavascript: true, //允许执行js代码
//      ),
    );
  }
}
