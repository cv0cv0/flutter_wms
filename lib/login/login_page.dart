import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_wms/home/home_page.dart';
import 'package:flutter_wms/widget/loading_indicator.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = new TextEditingController();
  final _passwordController = new TextEditingController();

  String _usernameErrorText;
  String _passwordErrorText;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) => new Scaffold(
        body: Stack(
          children: <Widget>[
            new SingleChildScrollView(
              reverse: true,
              child: new Column(
                children: <Widget>[
                  _image(),
                  _username(),
                  _password(),
                  _button(),
                ],
              ),
            ),
            _isLoading ? new LoadingIndicator() : new Container(),
          ],
        ),
      );

  _image() => new Image.asset(
        'assets/images/bg_login.png',
        width: 750.0,
      );

  _username() => _buildInputWidget(32.0, 'assets/icons/ic_jobnumber.png',
      '请输入工号', false, _usernameController, _usernameErrorText);

  _password() => _buildInputWidget(16.0, 'assets/icons/ic_password.png',
      '请输入密码', true, _passwordController, _passwordErrorText);

  _button() => new Container(
        margin: const EdgeInsets.only(
            left: 28.0, top: 32.0, right: 28.0, bottom: 8.0),
        height: 50.0,
        width: 750.0,
        child: new RaisedButton(
          color: const Color(0xffff7528),
          child: new Text(
            '登录',
            style: const TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          onPressed: () => _login(),
        ),
      );

  _buildInputWidget(
          double marginTop,
          String iconPath,
          String hintText,
          bool obscureText,
          TextEditingController controller,
          String errorText) =>
      new Container(
        margin: new EdgeInsets.only(left: 28.0, top: marginTop, right: 28.0),
        decoration: new BoxDecoration(
          border: new Border(
            bottom: new BorderSide(
              width: 1.0,
              color: const Color(0xffd1d1d1),
            ),
          ),
        ),
        child: new TextField(
          controller: controller,
          obscureText: obscureText,
          onChanged: (text) {
            if (errorText != null) {
              setState(() {
                if (errorText == _usernameErrorText) {
                  _usernameErrorText = null;
                } else if (errorText == _passwordErrorText) {
                  _passwordErrorText = null;
                }
              });
            }
          },
          decoration: new InputDecoration(
            icon: new Image.asset(iconPath),
            hintText: hintText,
            errorText: errorText,
            border: InputBorder.none,
          ),
        ),
      );

  _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    setState(() {
      if (username == null || username.isEmpty) {
        _usernameErrorText = '请输入工号';
      }
      if (password == null || password.isEmpty) {
        _passwordErrorText = '请输入密码';
      }
    });

    if (_usernameErrorText == null || _passwordErrorText == null) {
      setState(() {
        _isLoading = true;
      });

      new Timer(new Duration(seconds: 1), () {
        // setState(() {
        //   _isLoading = false;
        // });

        Navigator.of(context).pushReplacement(
          new MaterialPageRoute(
            builder: (BuildContext context) => new HomePage(),
          ),
        );
      });
    }
  }
}
