import 'package:flutter/material.dart';
import 'package:flutter_wms/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('我的'),
        ),
        backgroundColor: Color(0xffe9e9e9),
        body: Column(
          children: <Widget>[
            _buildItem(12.0, '姓名', content: '刘明'),
            _buildItem(12.0, '账号', content: 'liuming'),
            _buildItem(12.0, '修改密码', onTap: () {}),
            _buildItem(18.0, '版本更新', onTap: () {}),
            Container(
              margin: EdgeInsets.only(top: 32.0, left: 24.0, right: 24.0),
              width: 750.0,
              height: 46.0,
              child: RaisedButton(
                color: Color(0xffff7528),
                child: Text('退出登录',
                    style: TextStyle(color: Colors.white, fontSize: 18.0)),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: Text('要退出当前账号吗？'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('取消'),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            FlatButton(
                              child: Text('确定'),
                              onPressed: () async {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.setBool('is_login', false);

                                Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(),
                                      ),
                                      (route) => route == null,
                                    );
                              },
                            ),
                          ],
                        ),
                  );
                },
              ),
            ),
          ],
        ),
      );

  _buildItem(double marginTop, String title,
          {String content, GestureTapCallback onTap}) =>
      Container(
        margin: EdgeInsets.only(top: marginTop),
        height: 48.0,
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.only(left: 24.0, right: 12.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text(title,
                        style: TextStyle(
                            fontSize: 16.0, color: Color(0xff666666))),
                  ),
                  Expanded(
                    flex: 7,
                    child: content == null
                        ? Container()
                        : Text(content,
                            style: TextStyle(
                                fontSize: 16.0, color: Color(0xff333333))),
                  ),
                  onTap == null
                      ? Container()
                      : Icon(Icons.arrow_forward_ios, color: Color(0xff999999)),
                ],
              ),
            ),
          ),
        ),
      );
}
