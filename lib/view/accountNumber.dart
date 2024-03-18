import 'package:flutter/material.dart';
import 'package:sadam/data/user_data.dart';
import 'package:sadam/widget/button.dart';
import 'package:sadam/widget/text.dart';
import 'package:sadam/navi/bottom_navi.dart';
import 'package:sadam/data/colors.dart';
import 'package:sadam/controller/controller.dart';
import 'package:sadam/view/home.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                controller: accountController,
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
                controller: bankNameController,
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
                controller: phoneNumberController,
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
                controller: accountOwnerController,
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
            // button2(size.width*0.893, 50, "등록하기", home(), context, false),
            SizedBox(
                width: size.width*0.893,
                height: 50,
                child: ButtonTheme(
                  minWidth: size.width*0.893,//버튼의 최소 가로 길이
                  height: 50,//버튼의 세로 길이
                  shape: RoundedRectangleBorder( //버튼을 둥글게 처리
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(
                    color: Color(0xff73020C),
                    onPressed: () {
                      if(bankNameController.text.isNotEmpty&& accountController.text.isNotEmpty&&
                          accountOwnerController.text.isNotEmpty&& phoneNumberController.text.isNotEmpty){
                        UsersData users = UsersData(userName: userNameController.text, loginType: loginTypeController.text);
                        users.AccountUpdate(uidController.text);
                        Navigator.popUntil(context, ModalRoute.withName('/'));
                        bankNameController.text = "";
                        accountController.text = "";
                        accountOwnerController.text = "";
                        phoneNumberController.text = "";
                        print("${bankNameController.text}\n${accountOwnerController.text}\n${accountController.text}\n${phoneNumberController.text}");
                      }
                      else{
                        Fluttertoast.showToast(
                            msg: "모두 입력해주세요.",
                            toastLength: Toast.LENGTH_SHORT, // Toast 길이 설정 (SHORT 또는 LONG)
                            gravity: ToastGravity.TOP, // Toast 위치 설정 (TOP, BOTTOM, CENTER)
                            timeInSecForIosWeb: 1, // iOS 및 웹에서 표시 시간 설정 (초)
                            backgroundColor: Colors.black.withOpacity(0.7), // 배경색 설정
                            textColor: Colors.white, // 텍스트 색상 설정
                            fontSize: 16.0 // 텍스트 크기 설정

                        );

                      }

                    },
                    child: Container(
                      width: 302,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "등록하기",
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavi(context),
    );
  }
}
