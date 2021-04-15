import 'dart:io';
import 'package:dimigoin/pages/main.dart';
import 'package:dimigoin/pages/meal.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      home: Root(),
    );
  }
}

class Root extends StatefulWidget {
  Root({Key key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int currentPageIndex = 0;

  Widget navbarIcon(String name, [bool selected]) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6),
      child: SvgPicture.asset(
        'asset/icon/$name.svg',
        color: selected == true ? Colors.primaries[0] : Colors.black,
        width: 28,
      ),
    );
  }

  Widget bottomNavbar(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 16, color: Colors.black.withOpacity(0.03))
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              label: "학생증",
              icon: navbarIcon('StudentCard'),
              activeIcon: navbarIcon('StudentCard', true),
            ),
            BottomNavigationBarItem(
              label: "학생증",
              icon: navbarIcon('StudentCard'),
              activeIcon: navbarIcon('StudentCard', true),
            ),
          ],
          selectedLabelStyle:
              TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          currentIndex: currentPageIndex,
          onTap: (index) => setState(() {
            currentPageIndex = index;
            print(index);
            Navigator.pushNamed(context, ['/home', '/meal'][index]);
          }),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        pages: [
          MaterialPage(child: MainPage(), name: '/home'),
          MaterialPage(child: MealPage(), name: '/meal')
        ],
      ),
      bottomNavigationBar: bottomNavbar(context),
    );
  }
}
