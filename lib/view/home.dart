import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sadam/data/colors.dart';
import 'package:sadam/view/add_sponser.dart';
import 'package:sadam/view/my_accident_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sadam/navi/change_view.dart';
import 'package:sadam/controller/controller.dart';
import 'package:sadam/widget/button.dart';
import 'package:sadam/view/add_accident.dart';
import 'package:sadam/navi/bottom_navi.dart';
import 'package:sadam/view/faq.dart';
import 'package:sadam/view/accountNumber.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sadam/view/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class home extends StatelessWidget {
  Future<void> _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // 로그아웃 후 필요한 작업을 수행할 수 있습니다.
      // Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => login(),
              settings: RouteSettings(name: '/')
          )
      );
      print(uidController.text);
    } catch (e) {
      print('Error logging out: $e');
      // 로그아웃 중에 오류가 발생한 경우 오류를 처리할 수 있습니다.
    }
  }
  //const home({super.key});
  List<String> image = ["assets/info1.png", "assets/info2.png", "assets/info3.png"];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future<void> deleteUser(String uid) async {
      try {
        // 사용자 데이터 삭제
        await FirebaseFirestore.instance.collection('users').doc(uid).delete();

        // Firebase Authentication에서 사용자 삭제
        await FirebaseAuth.instance.currentUser!.delete();

        print('사용자와 관련된 데이터가 성공적으로 삭제되었습니다.');
      } catch (e) {
        print('사용자 및 관련 데이터 삭제 중 오류가 발생했습니다: $e');
      }
    }
    return Scaffold(
      appBar: AppBar(
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
        ],
      ),
      drawer: Drawer(
        backgroundColor: Color(0xff1B1B1B),
        child: ListView(
          children: [
            SizedBox(height: 50,),
            list("보험 사고 알리미", context, home(), "nanumBold", 25, FontWeight.w700),
            SizedBox(height: 50,),
            list("계좌등록", context, AccountNumber(), 'nanumRegular', 16, FontWeight.w400),
            list("사고알림 상담글 등록", context, addFeed(), 'nanumRegular', 16, FontWeight.w400),
            list("나의 알림사고 확인하기", context, AccidentList(), 'nanumRegular', 16, FontWeight.w400),
            list("FAQ", context, FAQ(), 'nanumRegular', 16, FontWeight.w400),
            list("전화 상담 하기", context, home(), 'nanumRegular', 16, FontWeight.w400),
            ListTile(
              title: Text(
                "로그아웃",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'nanumRegular',
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                ),
              ),
              onTap: (){
                _logout(context);
              },
            ),ListTile(
              title: Text(
                "회원 탈퇴",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'nanumRegular',
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                ),
              ),
              onTap: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => login(),
                        settings: RouteSettings(name: '/')
                    )
                );

                deleteUser(uidController.text);
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Center(
            child: Column(
              children: [
                Container(
                  width: size.width*0.88,
                  height: size.height*0.591,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: 3,
                    itemBuilder: (context, index) => (
                      Container(
                        child: Image.asset(image[index]),
                      )
                    ),
                  )
                ),
                SizedBox(height: 15,),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: WormEffect(
                    activeDotColor: Color(0xff000000),
                    dotColor: mainGray,
                    radius: 10,
                    dotHeight: 10,
                    dotWidth: 10
                  ),
                  onDotClicked: (index){},
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    button2(size.width*0.666, 60, "사고 알림 상담글 등록", addFeed(), context, true),
                    SizedBox(width: size.width*0.066,),
                    button1(60, 60, 60, "FAQ", mainBlack, FAQ(), context),
                  ],
                )
              ],
            ),

          ),
        ],
      ),
      bottomNavigationBar: BottomNavi(context)

    );
  }
}

Widget list(String t, BuildContext c, Widget moveWidget, String nanum, double size, FontWeight fontWeight){
  return ListTile(
    title: Text(
      t,
      style: TextStyle(
        color: Colors.white,
        fontFamily: nanum,
        fontSize: size,
        fontWeight: fontWeight
      ),
    ),
    onTap: (){
      navi change = navi(context: c, moveWidget: moveWidget);
      change.changeView();
    },
  );
}