import 'package:dimigoin/class.dart';
import 'package:dimigoin/component/CardHeader/view.dart';
import 'package:dimigoin/component/DailyMeal/view.dart';
import 'package:dimigoin/component/SelfStudyStatus/view.dart';
import 'package:dimigoin/component/TimeTable/view.dart';
// import 'package:dimigoin/style/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Modal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Container(
            padding: EdgeInsets.only(top: 32),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                SvgPicture.asset(
                  'asset/icon/logout.svg',
                  width: 28,
                  color: Theme.of(context).accentColor,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 24),
                  child: Text('정말 로그아웃 하시겠습니까?',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: TextButton(
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          '취소',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8)))),
                      ),
                    )),
                    Expanded(
                      child: TextButton(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            '확인',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).accentColor),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(8)))),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ProfilePic extends StatelessWidget {
  showLogoutModal(BuildContext context) {
    showDialog(context: context, builder: (BuildContext _) => Modal());
  }

  @override
  Widget build(BuildContext context) {
    // print(Colors.primaries[0].value.toRadixString(16));
    return GestureDetector(
        onTap: () => showLogoutModal(context),
        child: Container(
          child: ClipRRect(
              child: Image.network(
                'https://rycont.github.io/assets/image/logo.png',
                width: 32,
              ),
              borderRadius: BorderRadius.circular(18)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
                color: Colors.red, width: 3, style: BorderStyle.solid),
          ),
        ));
  }
}

class Navbar extends StatelessWidget {
  final mainIcons = [
    LabelWithIcon(icon: 'ingangsil', label: '인강실'),
    LabelWithIcon(icon: 'laundry', label: '외출'),
    LabelWithIcon(icon: 'other', label: '멘토링')
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFFFFFFFF),
        child: Padding(
            padding: EdgeInsets.only(top: 40, left: 30, right: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('asset/image/brandlogo.svg',
                        color: Theme.of(context).primaryColor),
                    ProfilePic()
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Row(
                      children: List.generate(
                          mainIcons.length,
                          (index) => Padding(
                                padding:
                                    EdgeInsets.only(left: index == 0 ? 0 : 40),
                                child: Container(
                                  width: 36,
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                          'asset/icon/' +
                                              mainIcons[index].icon +
                                              '.svg',
                                          color: Color(0xFF272727),
                                          width: 24),
                                      Padding(
                                        padding: EdgeInsets.only(top: 6),
                                        child: Text(
                                          mainIcons[index].label,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w900,
                                              color: Color(0xFF272727)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'asset/icon/notice.svg',
                          width: 24,
                        ),
                        Expanded(
                            child: Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: (Text('터졌어요!',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15))))),
                        Text('2021년 04월 19일',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black.withOpacity(0.6))),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: SvgPicture.asset('asset/icon/hamburger.svg'),
                        )
                      ],
                    ))
              ],
            )));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF9F9F9),
        // backgroundColor: Colors.red,
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Navbar(),
            CardHeader(title: '자습현황', subTitle: '우리반 현황'),
            SelfStudyStatus(),
            CardHeader(title: '오늘의 급식', subTitle: '주간 급식'),
            DailyMeal(),
            CardHeader(title: '시간표'),
            TimeTable()
          ],
        )));
  }
}
