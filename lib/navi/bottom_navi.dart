import 'package:flutter/material.dart';
import 'package:sadam/navi/change_view.dart';
import 'package:sadam/view/my_accident_list.dart';

Widget BottomNavi(BuildContext context){
  Size size = MediaQuery.of(context).size;
  return Container(
    color: Color(0xff1B1B1B),
    height: size.height*0.12,
    width: double.maxFinite,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(size.width*0.4, size.height*0.061)),
                backgroundColor: MaterialStateProperty.all(Color(0xff73020c))
            ),
            onPressed: (){
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            child: Text(
              "홈화면",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16
              ),
            )
        ),
        ElevatedButton(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(size.width*0.4, size.height*0.061))
            ),
            onPressed: (){
              navi a = navi(context: context, moveWidget: AccidentList());
              a.changeView();
            },
            child: Text(
              "나의 알림사고\n확인하기",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 14
              ),
              textAlign: TextAlign.center,
            )
        )
      ],
    ),
  );
}