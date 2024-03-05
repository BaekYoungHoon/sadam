import 'package:flutter/material.dart';
import 'package:sadam/widget/button.dart';
import 'package:sadam/widget/text.dart';
import 'package:sadam/navi/bottom_navi.dart';
import 'package:sadam/data/colors.dart';
import 'package:sadam/controller/controller.dart';
import 'package:sadam/view/home.dart';

class AccountNumber extends StatelessWidget {
  const AccountNumber({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: textBold("계좌번호 등록", 16, FontWeight.w700),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textBold("계좌번호", 16, FontWeight.w700),
            Container(
              alignment: Alignment.center,
              width: size.width*0.893,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: mainGray
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "계좌번호를 입력해주세요.",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            textBold("은행명", 16, FontWeight.w700),
            Container(
              alignment: Alignment.center,
              width: size.width*0.893,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: mainGray
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "은행명을 입력해주세요.",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            textBold("핸드폰번호", 16, FontWeight.w700),
            Container(
              alignment: Alignment.center,
              width: size.width*0.893,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: mainGray
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "핸드폰번호를 입력해주세요.",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            textBold("이름", 16, FontWeight.w700),
            Container(
              alignment: Alignment.center,
              width: size.width*0.893,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: mainGray
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "이름을 입력해주세요.",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none
                  ),
                ),
              ),
            ),
            SizedBox(height: 40,),
            button2(size.width*0.893, 50, "등록하기", home(), context, false)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavi(context),
    );
  }
}
