import 'package:flutter/material.dart';
import 'package:sadam/navi/change_view.dart';
import 'package:sadam/provider/ex.dart';
import 'package:provider/provider.dart';
import 'package:sadam/controller/controller.dart';
import 'package:sadam/view/my_accident_list.dart';
import 'package:sadam/view/my_accident_list.dart';

Widget button1(double width, double height, double radius, String text, Color color, Widget widget, BuildContext context){
  return SizedBox(
      width: width,
      height: height,
      child: ButtonTheme(
        minWidth: width,//버튼의 최소 가로 길이
        height: height,//버튼의 세로 길이
        shape: RoundedRectangleBorder( //버튼을 둥글게 처리
          borderRadius: BorderRadius.circular(radius),
        ),
        child: MaterialButton(
          color: color,
          onPressed: () {
            navi na = navi(context: context, moveWidget: widget);
            na.changeView();
          },
          child: Container(
            width: 302,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ],
            ),
          ),
        ),
      )
  );
}

Widget button2(double w, double h, String t, Widget widget,BuildContext context, bool iss){
  return SizedBox(
      width: w,
      height: h,
      child: ButtonTheme(
        minWidth: w,//버튼의 최소 가로 길이
        height: h,//버튼의 세로 길이
        shape: RoundedRectangleBorder( //버튼을 둥글게 처리
            borderRadius: BorderRadius.circular(10),
        ),
        child: MaterialButton(
          color: Color(0xff73020C),
          onPressed: () {
            if(iss){
              navi na = navi(context: context, moveWidget: widget);
              na.changeView();
            }
            else{
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => widget,
                  settings: RouteSettings(name: '/')
                )
              );
            }

          },
          child: Container(
            width: 302,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  t,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ],
            ),
          ),
        ),
      )
  );
}

Widget button3(double width, double height, double radius, String text, Color color, BuildContext context){
  DropdownProvider dropdown = Provider.of<DropdownProvider>(context);
  return SizedBox(
      width: width,
      height: height,
      child: ButtonTheme(
        minWidth: width,//버튼의 최소 가로 길이
        height: height,//버튼의 세로 길이
        shape: RoundedRectangleBorder( //버튼을 둥글게 처리
          borderRadius: BorderRadius.circular(radius),
        ),
        child: MaterialButton(
          color: color,
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AccidentList())
            );
            dropdown.selectedAccidentType = null;
            dropdown.selectedInsuranceCoverageType = null;
            dropdown.selectedAccidentSite = null;
            consultingController.text = "";
            accidentDetailController.text = "";
          },
          child: Container(
            width: 302,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ],
            ),
          ),
        ),
      )
  );
}