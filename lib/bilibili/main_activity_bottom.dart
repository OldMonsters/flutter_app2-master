import 'package:flutter/material.dart';
class MainActivityBottomBar extends StatefulWidget{
  ValueChanged onTabCallBack;
  var selectedIndex;
  MainActivityBottomBar(this.onTabCallBack, this.selectedIndex);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainActivityBottomBarState();
  }
}

class _MainActivityBottomBarState extends State<MainActivityBottomBar>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        InkWell(
          onTap: () {
            widget.selectedIndex = 0;
            widget.onTabCallBack(0);
            setState(() {});
          },
          child: Column(
            children: <Widget>[
              Icon(
                Icons.home,
                color: widget.selectedIndex == 0 ? Colors.pink : Colors.grey,
              ),
              Text(
                '首页',
                style: TextStyle(
                    color: widget.selectedIndex == 0 ? Colors.pink : Colors.grey,
                    fontSize: 12),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            widget.selectedIndex = 1;
            widget.onTabCallBack(1);
            setState(() {});
          },
          child: Column(
            children: <Widget>[
              Icon(
                Icons.tv,
                color: widget.selectedIndex == 1 ? Colors.pink : Colors.grey,
              ),
              Text(
                '频道',
                style: TextStyle(
                    color: widget.selectedIndex == 1 ? Colors.pink : Colors.grey,
                    fontSize: 12),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            widget.selectedIndex = 2;
            widget.onTabCallBack(2);
            setState(() {});
          },
          child: Column(
            children: <Widget>[
              Icon(
                Icons.star_border,
                color: widget.selectedIndex == 2 ? Colors.pink : Colors.grey,
              ),
              Text(
                '动态',
                style: TextStyle(
                    color: widget.selectedIndex == 2 ? Colors.pink : Colors.grey,
                    fontSize: 12),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            widget.selectedIndex = 3;
            widget.onTabCallBack(3);
            setState(() {});
          },
          child: Column(
            children: <Widget>[
              Icon(
                Icons.card_travel,
                color: widget.selectedIndex == 3 ? Colors.pink : Colors.grey,
              ),
              Text(
                '会员购',
                style: TextStyle(
                    color: widget.selectedIndex == 3 ? Colors.pink : Colors.grey,
                    fontSize: 12),
              )
            ],
          ),
        ),
      ],
    );
  }

}

