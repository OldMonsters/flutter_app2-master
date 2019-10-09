import 'package:flutter/material.dart';

class HomeFirstTab extends StatefulWidget {
  TabController _controller;
  HomeFirstTab(this._controller);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeFirstTabDtate();
  }
}

class _HomeFirstTabDtate extends State<HomeFirstTab> {
  //var _controller;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 40,
      //第一行：TabBar
      child: TabBar(
        indicatorColor: Colors.pink,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: <Widget>[
          Text('直播', style: TextStyle(color: Colors.black)),
          Text('推荐', style: TextStyle(color: Colors.black)),
          Text('追番', style: TextStyle(color: Colors.black)),
          Text('国产', style: TextStyle(color: Colors.black)),
          Text('故事', style: TextStyle(color: Colors.black)),
        ],
        controller: widget._controller,
      ),
    );
  }
}
