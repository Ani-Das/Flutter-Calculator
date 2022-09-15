// ignore_for_file: prefer_const_constructors

import 'package:calculatorproj_git/constants/App_constants.dart';
import 'package:flutter/material.dart';

class left_bar extends StatelessWidget {
  final double barWidth;

  const left_bar({Key key, @required this.barWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 25,
          width: barWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: accenthexColor),
        )
      ],
    );
  }
}
