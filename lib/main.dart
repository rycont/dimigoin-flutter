import 'dart:io';
import 'package:dimigoin/page/rootpages/main.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';

void main() {
  runApp(MyApp());
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle("DIMIGOin");
    setWindowMinSize(Size(375, 750));
    setWindowMaxSize(Size(600, 1000));
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(232, 60, 119, 1),
        accentColor: Color.fromRGBO(232, 60, 119, 1),
      ),
      routes: {
        '/': (BuildContext _) => RootPages()
      },
    );
  }
}
