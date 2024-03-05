import 'package:flutter/material.dart';

Widget textRegular(String title, double size, FontWeight fontweight, String fontFamily){
  return Text(
    title,
    style: TextStyle(
      fontSize: size,
      fontWeight: fontweight,
      fontFamily: fontFamily
    ),
  );
}

Widget textBold(String title, double size, FontWeight fontWeight){
  return Text(
    title,
    style: TextStyle(
      fontFamily: 'nanumBold',
      fontWeight: fontWeight,
      fontSize: size
    ),
  );
}