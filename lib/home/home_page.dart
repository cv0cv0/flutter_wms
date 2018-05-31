import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text(
            '首页',
            style: new TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            new IconButton(
              iconSize: 32.0,
              icon: new Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: new Stack(
          children: <Widget>[
            new Image.asset('assets/images/bg_home.png',
                width: 750.0, height: 1334.0, fit: BoxFit.cover),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildCardWidget(
                      const Color(0xffff8586),
                      const EdgeInsets.only(top: 36.0, left: 32.0),
                      'assets/icons/ic_shelves.png',
                      '上架',
                      () {},
                    ),
                    _buildCardWidget(
                      const Color(0xff82cee8),
                      const EdgeInsets.only(top: 36.0, left: 52.0),
                      'assets/icons/ic_picking.png',
                      '拣配',
                      () {},
                    ),
                  ],
                ),
                _buildCardWidget(
                  const Color(0xff6cd995),
                  const EdgeInsets.only(top: 46.0, left: 32.0),
                  'assets/icons/ic_adjustment.png',
                  '货位调整',
                  () {},
                ),
              ],
            ),
          ],
        ),
      );

  _buildCardWidget(Color color, EdgeInsetsGeometry margin, String iconPath,
          String text, GestureTapCallback onTap) =>
      new Card(
        color: color,
        margin: margin,
        shape: const RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
        ),
        child: new InkWell(
          onTap: onTap,
          child: new Container(
            width: 130.0,
            height: 130.0,
            padding: const EdgeInsets.only(top: 35.0, bottom: 20.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Image.asset(iconPath),
                new Text(
                  text,
                  style: new TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
        ),
      );
}
