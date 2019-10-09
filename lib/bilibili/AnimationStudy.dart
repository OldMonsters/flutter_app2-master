import 'package:flutter/material.dart';
import 'dart:ui';

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

  AnimationController animationController;
  Animation<double> tween;
  double xp = 1.0;
  double yp = 1.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        new AnimationController(duration: Duration(seconds: 4), vsync: this);
    tween = new Tween<double>(begin: 50, end: 200).animate(animationController);
    tween.addListener(() {
      setState(() {
        print(tween.value);
        xp = -2.3 + tween.value / 32.6;
        yp = 2.3 - tween.value / 32.6;
      });
    });
    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
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
                      borderRadius: BorderRadius.all(Radius.circular(50))),
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
          body: new Center(
            child: Stack(
              alignment: Alignment(xp, yp),
              children: <Widget>[
                Container(
                  width: 300,
                  height: 400,
                ),
                Container(
                  width: tween.value,
                  height: tween.value,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(
                          255,
                          (tween.value * 2.5).toInt(),
                          (tween.value * 0.5).toInt(),
                          (tween.value * 0.5).toInt()),
                      borderRadius:
                          BorderRadius.all(Radius.circular(tween.value * 0.5))),
                ),
              ],
            ),
          )),
    );
  }
}
