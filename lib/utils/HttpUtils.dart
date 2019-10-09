import 'dart:convert';

import 'package:dio/dio.dart';

class HttpUtils{
  static void getHttp({url, onCallBack}) async {
    try {
      Response response = await Dio().get(url);
      onCallBack(response.toString());
      print(response);
    } catch (e) {
      print(e);
    }
  }
}