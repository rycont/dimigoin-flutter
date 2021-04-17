import 'package:flutter/material.dart';

final activeDailyHeaderTextStyleBuilder =
    (BuildContext context) => TextStyle(color: Theme.of(context).accentColor);
const dailyHeaderTextStyle = TextStyle(
  color: Color(0xFFD1D1D1),
  fontSize: 16,
  fontWeight: FontWeight.w700,
);
// const dailyHeaderWrapperStyle = BoxDecoration(
//     border: Border(bottom: BorderSide(color: Color(0xFFD1D1D1), width: 1)));
final dailyHeaderWrapperStyleBuilder = (bool active, BuildContext context) =>
    BoxDecoration(
        border: Border(
            bottom: BorderSide(
                color: (active
                    ? Theme.of(context).accentColor
                    : Color(0xFFD1D1D1)),
                width: active ? 3 : 1)));

const subjectTextStyle = TextStyle(color: Color(0xFFD1D1D1), fontSize: 18);
const subjectActiveColorTextStyle = TextStyle(color: Colors.black);
