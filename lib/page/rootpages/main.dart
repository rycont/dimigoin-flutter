import 'package:flutter/material.dart';
import 'package:dimigoin/component/bottomNavBar.dart';

class RootPages extends StatefulWidget {
  RootPages({Key key}) : super(key: key);
  @override
  _RootPagesState createState() => _RootPagesState();
}

class _RootPagesState extends State<RootPages> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        currentPageIndex: pageIndex,
        onIndexChanged: (index) => {
          setState(() => {pageIndex = index})
        }),
      body: Text('$pageIndex번 페이지'),
    );
  }
}
