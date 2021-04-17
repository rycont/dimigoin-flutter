import 'package:flutter/material.dart';
import './style.dart';

class CardHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  CardHeader({this.title, this.subTitle});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(title, style: headerTextStyle),
          if(subTitle != null) Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(subTitle, style: subHeaderTextStyle(context)))
        ],
      ),
    );
  }
}
