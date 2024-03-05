import 'package:flutter/material.dart';
import 'package:sadam/widget/button.dart';
import 'package:sadam/view/home.dart';
import 'package:sadam/data/colors.dart';
import 'package:provider/provider.dart';
import 'package:sadam/provider/ex.dart';

class complete extends StatelessWidget {
  const complete({super.key});

  @override
  Widget build(BuildContext context) {
    DropdownProvider dropdown = Provider.of<DropdownProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  child: Image.asset("assets/complete.png"),
                ),
                SizedBox(height: 32,),
                Text(
                  "상담글 등록 완료!",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(height: 11,),
                Text(
                  "답변이 등록되면 알림으로 알려드릴게요",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(height: 95,),
                button3(size.width*0.893, 50, 10, "내 사건 확인하기", mainRed, context)
              ],
            ),
          )
        ],
      ),
    );
  }
}
