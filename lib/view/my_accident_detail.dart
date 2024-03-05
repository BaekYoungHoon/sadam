import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:sadam/controller/controller.dart';
import 'package:sadam/navi/bottom_navi.dart';
import 'package:sadam/widget/button.dart';
import 'package:sadam/widget/text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sadam/data/colors.dart';
import 'package:sadam/view/home.dart';
import 'package:sadam/view/accountNumber.dart';
import 'package:sadam/provider/accident_detail.dart';

class accidentDetail extends StatelessWidget {
  String name = "";
  String id = "";
  String sponsor = "";
  String sponsorId = "";
  accidentDetail({
    required this.name,
    required this.id,
    required this.sponsor,
    required this.sponsorId
});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AccidentDetailP widget = Provider.of<AccidentDetailP>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: textRegular("나의 알림사고 상세정보", 18, FontWeight.w700, 'nanumBold'),
          leadingWidth: 60,
          automaticallyImplyLeading: true,
          toolbarHeight: 44,
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
          ]
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20, right: 20, top: 30,bottom: 50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              row("회원 성명", "홍길동", "회원 번호", "A0001", context),
              row("소개 회원", "김춘배", "회원 번호", "A0002", context),
              row("사고 종류", "화재 사고", "보험 담보 종류", "진단비", context),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textRegular("사고 지역", 16, FontWeight.w700, "nanumBold"),
                  SizedBox(height: 5,),
                  Container(
                    padding: EdgeInsets.all(15),
                    width: size.width*0.893,
                      height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: mainGray
                    ),
                    child: Text(
                      '부산',
                      style: TextStyle(
                        fontFamily: 'nanumRegular',
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                      ),
                      maxLines: 6,
                    ),
                  ),
                  SizedBox(height: 20,),
                  textRegular("상담 질문하기", 16, FontWeight.w700, "nanumBold"),
                  SizedBox(height: 5,),
                  Container(
                    padding: EdgeInsets.all(15),
                    width: size.width*0.893,
                    height: 144,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: mainGray
                    ),
                    child: Text(
                      '질문 내용 6줄 까지 나옴',
                      style: TextStyle(
                          fontFamily: 'nanumRegular',
                          fontWeight: FontWeight.w400,
                          fontSize: 14
                      ),
                      maxLines: 6,
                    ),
                  ),
                  SizedBox(height: 20,),
                  textRegular("보험 전문가 답변", 16, FontWeight.w700, "nanumBold"),
                  SizedBox(height: 5,),
                  Container(
                    padding: EdgeInsets.all(15),
                    width: size.width*0.893,
                    height: 144,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: mainGray
                    ),
                    child: Text(
                      '답변 내용 6줄 까지 나옴',
                      style: TextStyle(
                          fontFamily: 'nanumRegular',
                          fontWeight: FontWeight.w400,
                          fontSize: 14
                      ),
                      maxLines: 6,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      Container(
                        width: size.width*0.893,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            textBold("손해 사정 계약 체결 여부", 14, FontWeight.w700),
                            // SizedBox(width: size.width*0.132,),
                            Container(
                              width: 130,
                              height: 40,
                              decoration: BoxDecoration(
                                color: mainGray,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                ""
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 18,),
                      Container(
                        width: size.width*0.893,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            textBold("수수료 정산 금액", 14, FontWeight.w700),
                            // SizedBox(width: size.width*0.267,),
                            Container(
                              width: 130,
                              height: 40,
                              decoration: BoxDecoration(
                                color: mainGray,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                  ""
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  button2(size.width*0.893, 50, "수수료 수령 계좌 등록하기", AccountNumber(), context, true),
                  SizedBox(height: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "댓글",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                        ),
                      ),
                      SizedBox(height: 8,),
                      Container(
                        width: size.width*0.893,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: size.width*0.68,
                              height: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: mainGray
                              ),
                              child: TextField(
                                controller: commentController,
                                maxLines: 5,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none
                                  ),
                                ),
                              ),
                            ),
                            ButtonTheme(
                              minWidth: 60,//버튼의 최소 가로 길이
                              height: 140,//버튼의 세로 길이
                              shape: RoundedRectangleBorder( //버튼을 둥글게 처리
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: MaterialButton(
                                color: mainBlack,
                                onPressed: () {
                                  widget.addWidget(
                                    Container(
                                      width: size.width*0.893,
                                      child: Column(
                                        children: [
                                          SizedBox(height: 20,),
                                          Container(
                                            child: Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(60),
                                                        color: mainGray
                                                      ),
                                                      width: size.width*0.16,
                                                      height: size.height*0.074,
                                                    ),
                                                    Text(
                                                      "홍길동"
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(10),
                                                    child: Text(
                                                      "Adsf"
                                                    ),
                                                  ),
                                                  height: 85,
                                                  width: size.width*0.68,
                                                  margin: EdgeInsets.all(20),
                                                  alignment: Alignment.topLeft,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: mainGray
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  );
                                  print(widget.widgets);
                                },
                                child: Container(
                                  width: size.width*0.106,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '댓글\n추가',
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
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              Consumer<AccidentDetailP>(
                builder: (context, widgetModel, _) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: widgetModel.widgets,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavi(context),
    );
  }
}

Widget row(String title1, String index1, String title2, String index2, BuildContext context){
  Size size = MediaQuery.of(context).size;
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textRegular(title1, 16, FontWeight.w700, 'nanumBold'),
          SizedBox(height: 4,),
          Container(
            width: size.width*0.426,
            height: 50,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: mainGray
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: textRegular(index1, 14, FontWeight.w400, 'nanumRegular'),
            ),
          )
        ],
      ),
      SizedBox(width: size.width*0.03,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textRegular(title2, 16, FontWeight.w700, 'nanumBold'),
          SizedBox(height: 4,),
          Container(
            width: size.width*0.426,
            height: 50,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: mainGray
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: textRegular(index2, 14, FontWeight.w400, 'nanumRegular'),
            ),
          ),
          SizedBox(height: 26,)
        ],
      )
    ],
  );
}