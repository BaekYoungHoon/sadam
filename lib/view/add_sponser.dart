import 'package:flutter/material.dart';
import 'package:sadam/data/colors.dart';
import 'package:sadam/widget/button.dart';
import 'package:sadam/view/home.dart';
import 'package:sadam/data/colors.dart';
import 'package:sadam/controller/controller.dart';
import 'package:sadam/login/social_login.dart';//임시

class Sponser extends StatelessWidget {
  const Sponser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(28, 98, 28, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "소개 회원 등록",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(height: 8,),
            TextField(
              controller: sponsoController,
              decoration: InputDecoration(
                filled: true,
                fillColor: mainGray,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: mainGray,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
                hintText: "소개 회원을 입력해주세요."
              ),
            ),
            SizedBox(height: 23,),
            // button2(335, 50,"확인", home(), context, false),
            SizedBox(
                width: 335,
                height: 50,
                child: ButtonTheme(
                  minWidth: 335,//버튼의 최소 가로 길이
                  height: 50,//버튼의 세로 길이
                  shape: RoundedRectangleBorder( //버튼을 둥글게 처리
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(
                    color: Color(0xff73020C),
                    onPressed: () {
                      if(sponsoController.text.isEmpty){
                        print(sponsoController.text);
                      }
                      else{
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => home(),
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
                            "등록",
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
            SizedBox(height: 56,),
            Center(
              child: Column(
                children: [
                  Text(
                    "소개회원이 없으신가요?",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14
                    ),
                  ),
                  SizedBox(height: 14,),
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => home(),
                              settings: RouteSettings(name: '/')
                          )
                      );
                    },
                    child: Text(
                      "건너뛰기",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Color(0xff0000000),
                        fontSize: 16
                      ),
                    )
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
