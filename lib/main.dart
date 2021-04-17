import 'dart:io';
import 'package:dimigoin/page/rootpages/home.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

void main() {
  runApp(MyApp());
  // if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
  //   setWindowTitle("DIMIGOin");
  //   setWindowMinSize(Size(375, 750));
  //   setWindowMaxSize(Size(600, 1000));
  // }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFE83C77),
        accentColor: Color(0xFFE83C77),
        fontFamily: 'NanumSquare'
      ),
      routes: {
        '/': (BuildContext _) => HomePage()
      },
    );
  }
}
