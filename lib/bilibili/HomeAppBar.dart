import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  ValueChanged<int> _valueChanged;
  HomeAppBar(this._valueChanged);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _HomeAppBarState();
  }

  @override
  Size get preferredSize => Size(100, 50);
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      elevation: 0,
      title: Row(
        children: <Widget>[
          Stack(
            alignment: Alignment(1.3, -1.3),
            children: <Widget>[
              ClipOval(
                child: Image.asset('images/咨询@2x.png', width: 25, height: 25),
              ),
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
              child: InkWell(
                onTap: (){
                  widget._valueChanged(10);
                },
                child: Icon(Icons.access_time, color: Colors.white),
              )),
        ],
      ),
      centerTitle: true,
    );
  }
}
