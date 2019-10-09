import 'package:flutter/material.dart';

import 'HomeFragment.dart';
import 'main_activity_bottom.dart';

void main() => runApp(new BottomBar());

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material",
      home: MainActivity(),
    );
  }
}

class MainActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainActivityState();
  }
}

class _MainActivityState extends State<MainActivity> {
  var fragmentPageList = <Widget>[];
  var selectedIndex = 0;


  @override
  void initState() {
    fragmentPageList.add(HomeFragment());
    fragmentPageList.add(Center(
      child: Text('第二个界面'),
    ));
    fragmentPageList.add(Center(
      child: Text('第三个界面'),
    ));
    fragmentPageList.add(Center(
      child: Text('第四个界面'),
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //double scrrenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 50,
              child: fragmentPageList[selectedIndex],
            )
          ],
        ),
        bottomSheet: Container(
          padding: EdgeInsets.only(top: 7),
          width: 400,
          height: 50,
          color: Colors.white,
          child: MainActivityBottomBar(selected, selectedIndex),
        ),
      ),
    );
  }

  //作为接受者
  Function selected(var index){
    selectedIndex = index;
    setState(() {

    });
  }
}
