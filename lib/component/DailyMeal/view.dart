import 'package:dimigoin/component/DailyMeal/style.dart';
import 'package:flutter/material.dart';

class MealPiece extends StatelessWidget {
  final String headerText;
  final List<String> meal;
  final bool active;
  MealPiece({@required this.headerText, @required this.meal, this.active = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          headerText,
          style:  mealHeaderTextStyle.merge(active ? activePieceTextStyle : null),
        ),
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              meal.join(' | '),
              style: mealMenuTextStyle.merge(active ? activePieceTextStyle : null),
            ))
      ]),
    );
  }
}

const sampleMeal = [
  "베이컨&소시지구이",
  "치킨너겟",
  "스트링치즈",
  "잡곡밥",
  "건새우아욱국",
  "모듬과일",
  "포기김치",
  "오이소박이",
  "야채죽"
];

class DailyMeal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MealPiece(
          headerText: '아침',
          meal: sampleMeal,
          active: true,
        ),
        MealPiece(
          headerText: '점심',
          meal: sampleMeal,
        ),
        MealPiece(
          headerText: '저녁',
          meal: sampleMeal,
        ),
      ],
    );
  }
}
