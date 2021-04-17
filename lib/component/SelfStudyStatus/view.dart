import 'package:dimigoin/class.dart';
import 'package:dimigoin/component/SelfStudyStatus/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlaceButton extends StatelessWidget {
  final String icon;
  final String label;
  final bool selected;
  PlaceButton({this.icon, this.label, this.selected});

  @override
  Widget build(BuildContext context) {
    final color = selected ? Theme.of(context).accentColor : Color(0xFFD1D1D1);
    return Column(
      children: [
        SvgPicture.asset('asset/icon/' + icon + '.svg',
            color: color, width: 24),
        Padding(
          padding: EdgeInsets.only(top: 6),
          child:
              Text(label, style: iconLabelStyle.merge(TextStyle(color: color))),
        )
      ],
    );
  }
}

class SelfStudyStatus extends StatelessWidget {
  final places = [
    LabelWithIcon(icon: 'desk', label: '교실'),
    LabelWithIcon(icon: 'healingsil', label: '안정실'),
    LabelWithIcon(icon: 'ingangsil', label: '인강실'),
    LabelWithIcon(icon: 'laundry', label: '세탁'),
    LabelWithIcon(icon: 'other', label: '기타'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFFD1D1D1)))),
            child: Padding(
                padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: places
                      .map((place) => PlaceButton(
                          icon: place.icon,
                          label: place.label,
                          selected: place.label == '교실'))
                      .toList(),
                )),
          ),
          Padding(padding: EdgeInsets.all(20), child: RichText(
              text: TextSpan(
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Color(0xFFD1D1D1)),
                  children: <TextSpan>[
                TextSpan(
                  text: '현재 나의 위치는 ',
                ),
                TextSpan(
                  text: '방과후 6실',
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
                TextSpan(
                  text: ' 입니다',
                ),
              ])),)
        ],
      ),
    );
  }
}
