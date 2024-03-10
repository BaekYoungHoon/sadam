import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sadam/data/colors.dart';
import 'package:sadam/data/user_data.dart';
import 'package:sadam/navi/bottom_navi.dart';
import 'package:sadam/navi/change_view.dart';
import 'package:sadam/view/my_accident_detail.dart';
import 'package:sadam/widget/text.dart';
import 'package:sadam/view/my_accident_detail.dart';
import 'package:sadam/navi/change_view.dart';

class AccidentList extends StatelessWidget {
  const AccidentList({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){

            },
            icon: Icon(FontAwesomeIcons.bell),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(mainRed),
              iconColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
          SizedBox(width: 20,)
        ],
        title: Text(
          "나의 알림사고 리스트",
          style: TextStyle(
            fontFamily: 'nanumBold',
            fontWeight: FontWeight.w700,
            fontSize: 18
          ),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  UserData("회원 성명", "홍길동", context), // 이름 부분은 데이터 불러와야함.
                  SizedBox(width: size.width*0.04,),
                  UserData("회원 번호", "A0001", context)
                ],
              ),
            ),
            SizedBox(height: 15,),
            Expanded(
              child: ListView.builder(
                itemCount: 9,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(left: 10,top: 10, bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20, bottom: 30),
                          child: textRegular("${index + 1}", 15, FontWeight.w700, 'nanumBold'),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textRegular("2024-01-01 10:00", 16, FontWeight.w700, 'nanumBold'),
                            SizedBox(height: 5,),
                            Container(
                              width: size.width*0.826,
                              height: 50,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: mainGray,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: textRegular("보험 종류", 14, FontWeight.w400, 'nanumRegular'),
                                  ),
                                  // SizedBox(width: size.width*0.48,),
                                  IconButton(
                                    onPressed: () {
                                      // navi n = navi(context: context, moveWidget: accidentDetail(여기다 이름 회원코드 넣어야함));
                                      // n.changeView();
                                      },
                                    icon: Image.asset('assets/arrow-down.png'),
                                  )
                                ],
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavi(context),
    );
  }
}
