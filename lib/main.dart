import 'package:flutter/material.dart';
import 'package:flutter_wms/home/home_page.dart';
import 'package:flutter_wms/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(new App());

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AppState();
}

class _AppState extends State<App> {
  // static const _platform = const MethodChannel('wms.rubu.com/channel');
  Widget _page = new Container();

  @override
    void initState() {
      super.initState();
      _getPage();
    }

  @override
  Widget build(BuildContext context) => new MaterialApp(
        title: 'Flutter WMS',
        theme: new ThemeData(
          primaryColor: const Color(0xffff7528),
        ),
        home: _page,
      );

  _getPage() async {
    // final isLogin = await _platform.invokeMethod('is_login') ?? false;
    final prefs = await SharedPreferences.getInstance();
    final isLogin = prefs.getBool('is_login') ?? false;

    setState(() {
      _page = isLogin ? new HomePage() : new LoginPage();
    });
  }
}
