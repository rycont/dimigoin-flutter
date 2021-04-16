import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  final int currentPageIndex;
  final Function onIndexChanged;
  BottomNavBar({@required this.currentPageIndex, @required this.onIndexChanged});

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

  @override
  Widget build(BuildContext context) {
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
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              label: "학생증",
              icon: navbarIcon('studentCard'),
              activeIcon: navbarIcon('studentCard', true),
            ),
            BottomNavigationBarItem(
              label: "학생증",
              icon: navbarIcon('studentCard'),
              activeIcon: navbarIcon('studentCard', true),
            ),
          ],
          selectedLabelStyle:
              TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          currentIndex: currentPageIndex,
          onTap: (index) => {
            onIndexChanged(index)
          },
        ));
  }
}
