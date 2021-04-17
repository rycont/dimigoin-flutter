import './style.dart';
import 'package:flutter/material.dart';

class DailyColumn extends StatelessWidget {
  final bool active;
  final sampleSubject = ["공수", "화1", "공수", "공수", "공수", "공수", "공수"];
  DailyColumn({this.active = false});
  @override
  Widget build(BuildContext context) {
    final activeDailyHeaderTextStyle =
        activeDailyHeaderTextStyleBuilder(context);
    final headerWrapperStyle =
        dailyHeaderWrapperStyleBuilder(active, context);
    return Expanded(
        child: Container(
          color: active ? Theme.of(context).accentColor.withAlpha(8) : Colors.white
          ,child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          decoration: headerWrapperStyle,
          child: Text(
            '월',
            style: dailyHeaderTextStyle
                .merge(active ? activeDailyHeaderTextStyle : null),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            children: [
              for (final subject in sampleSubject)
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(subject,
                      textAlign: TextAlign.center,
                      style: subjectTextStyle
                          .merge(active ? subjectActiveColorTextStyle : null)),
                )
            ],
          ),
        )
      ],
    )));
  }
}

class TimeTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // padding: EdgeInsets.only(left: 30, right: 30),
      child: Row(
        children: [
          DailyColumn(),
          DailyColumn(active: true),
          DailyColumn(),
          DailyColumn(),
          DailyColumn()
        ],
      ),
    );
  }
}
