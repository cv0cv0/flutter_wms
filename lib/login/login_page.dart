import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = new TextEditingController();
  final _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) => new Scaffold(
        body: new SingleChildScrollView(
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
      );

  _image() => new Image.asset(
        'assets/images/bg_login.png',
        width: 750.0,
      );

  _username() => _buildInputWidget(32.0, 'assets/icons/ic_jobnumber.png',
      '请输入工号', false, _usernameController);

  _password() => _buildInputWidget(
      16.0, 'assets/icons/ic_password.png', '请输入密码', true, _passwordController);

  _button() => new Container(
        margin: const EdgeInsets.only(left: 28.0, top: 32.0, right: 28.0,bottom: 6.0),
        height: 50.0,
        width: 750.0,
        child: new RaisedButton(
          color: const Color(0xffff7528),
          child: new Text(
            '登录',
            style: const TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          onPressed: () {},
        ),
      );

  _buildInputWidget(double marginTop, String iconPath, String hintText,
          bool obscureText, TextEditingController controller) =>
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
          decoration: new InputDecoration(
            icon: new Image.asset(iconPath),
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      );
}
