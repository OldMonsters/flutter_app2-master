//import 'package:flutter/material.dart';
//import 'dart:io';
//import 'dart:convert';
//
//class ListState extends State<List> {
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new ListView.builder(
//        itemCount: data == null ? 0 : data.length,
//        itemBuilder: (BuildContext context, int index) {
//          return new Card(
//              child: new Container(
//            padding: new EdgeInsets.all(10.0),
//            child: new ListTile(
//              subtitle: new Container(
//                child: new Column(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    new Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: [
//                          new Expanded(
//                            child: new Text(
//                              data[index]['title'],
//                              style: new TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                            ),
//                          )
//                        ]),
//                    new Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: [
//                          new Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              crossAxisAlignment: CrossAxisAlignment.center,
//                              children: [
//                                new Text('时间：'),
//                                new Text('2019-09-05'),
//                              ]),
//                        ]),
//                    new Row(
//                      children: <Widget>[
//                        new Container(
//                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 2),
//                          child: new Text('id:' * data[index]['id'].toString())
//                        )
//                      ],
//                    )
//                  ],
//                ),
//              ),
//              trailing:
//                  new Icon(Icons.keyboard_arrow_right, color: Colors.black26),
//            ),
//          ));
//        });
//  }
//
//  getData() async {
//    var url = 'https://jsonplaceholder.typicode.com/posts';
//    var httpClient = new HttpClient();
//
//    var result;
//    try {
//      var request = await httpClient.getUrl(Uri.parse(url));
//      var response = await request.close();
//      if (response.statusCode == HttpStatus.OK) {
//        var json = await response.transform(UTF8.decoder).join();
//        result = JSON.decoder(json);
//      } else {
//        result = 'Error getting JSON ${response.statusCode}';
//      }
//    } catch (exception) {
//      result = 'Fail';
//    }
//
//    if (!mounted) return;
//
//    setState(() {
//      var data;
//      data = result;
//    });
//  }
//}
