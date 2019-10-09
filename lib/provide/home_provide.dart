import 'dart:convert';

import 'package:flutter_app2/utils/HttpUtils.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeProvide extends Model{
  //classname.对象;
  //List<>;

  //网络请求
  void getDataServer(String url) async {
    HttpUtils.getHttp(
        url: 'http://www.baidu.com',
        onCallBack: (value) {
          json.decode(value);
          //classname 对象 = classname.fromJson(json.decode(value));
          //print(对象.resobj[0].liveImg);
          notifyListeners();
        });
  }
}