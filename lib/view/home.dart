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

class home extends StatelessWidget {
  //const home({super.key});
  List<String> image = ["assets/info1.png", "assets/info2.png", "assets/info3.png"];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            list("전화 상담 하기", context, home(), 'nanumRegular', 16, FontWeight.w400)
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