import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sadam/data/colors.dart';
import 'package:sadam/provider/expansion.dart';

Widget expansionTile(String title, String detail, BuildContext context){

  final expansionProvider = Provider.of<ExpansionTileProvider>(context);
  bool isExpanded = false;
  return ExpansionTile(
    collapsedBackgroundColor: mainGray,
    backgroundColor: mainGray,
    title: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
    ),
    children: [
      Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          detail,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400
          ),
        ),
      )
    ],
    onExpansionChanged: (bool expanding){
      expansionProvider.setExpanded((expanding));
    },
  );
}