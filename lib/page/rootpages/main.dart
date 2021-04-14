import 'package:flutter/material.dart';
import '../../component/bottomNavBar.dart';
import './home.dart';
import './meal.dart';

class RootPages extends StatefulWidget {
  RootPages({Key key}) : super(key: key);
  @override
  _RootPagesState createState() => _RootPagesState();
}

class _RootPagesState extends State<RootPages> {
  int pageIndex = 0;
  List<Widget> rootPages = [
    HomePage(),
    MealPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
          currentPageIndex: pageIndex,
          onIndexChanged: (index) => {
                setState(() => {pageIndex = index})
              }),
      body: rootPages[pageIndex],
    );
  }
}
