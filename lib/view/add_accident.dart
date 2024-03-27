import 'package:flutter/material.dart';
import 'package:sadam/controller/controller.dart';
import 'package:sadam/data/accident_data.dart';
import 'package:sadam/data/add_accident.dart';
import 'package:sadam/data/colors.dart';
import 'package:sadam/navi/bottom_navi.dart';
import 'package:sadam/provider/ex.dart';
import 'package:sadam/widget/button.dart';
import 'package:sadam/view/home.dart';
import 'package:sadam/view/add_complete.dart';
import 'package:sadam/provider/ex.dart';
import 'package:provider/provider.dart';
import 'package:sadam/widget/text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sadam/navi/change_view.dart';

class addFeed extends StatelessWidget {
  addFeed({super.key});



  @override
  Widget build(BuildContext context) {
    List<String> accidentSite = ["서울", "경기도", "인천", "대전", "광주", "대구", "부산", "울산",
      "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "강원도", "제주도"];
    List<String> insuranceCoverageType = ["사망 보험금", "장해 보험금", "진단비", "치료비",
      "법률상 배상책임", "원상회복비용", "합의금", "기타"];
    List<String> accidentTypeList = ["상해 사고", "교통 사고", "화재 사고", "산재 사고",
      "의료 사고", "배상 책임 사고", "질병 사고", "기타 사고"];

    var dropdown = Provider.of<DropdownProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "사고 알림 상담글 등록",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "회원 성명",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'nanumBold'
                        ),
                      ),
                      Container(
                        width: size.width*0.4267,
                        height: 50,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: mainGray
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            userNameController.text,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'nanumRegular'
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: size.width*0.04,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "회원 번호",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'nanumBold'
                        ),
                      ),
                      Container(
                        width: size.width*0.4267,
                        height: 50,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: mainGray
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                              "A0001",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'nanumRegular'
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20,top: 20),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "사고 종류",
            //         style: TextStyle(
            //             fontWeight: FontWeight.w700,
            //             fontSize: 16,
            //             fontFamily: 'nanumRegular'
            //         ),
            //       ),
            //       Stack(
            //         children: [
            //           Container(
            //             width: size.width*0.893,
            //             height: 50,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 color: mainGray
            //             ),
            //             child: Padding(
            //               padding: const EdgeInsets.only(right: 20,left: 20),
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   textRegular(dropdown.selectedAccidentType, 16, FontWeight.w400, "nanumRegular"),
            //                   IconButton(
            //                       icon: Icon(FontAwesomeIcons.arrowDown),
            //                       onPressed: (){
            //                         dropdown.isClickedType = !dropdown.isClickedType;
            //                       }
            //                       ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //           dropdown.isClickedType ?
            //           Column(
            //             children: [
            //               SizedBox(height: 47,),
            //               Container(
            //                 width: size.width*0.893,
            //                 height: 200,
            //                 decoration: BoxDecoration(
            //                   border: Border(
            //                     top: BorderSide(
            //                       width: 1,
            //                       color: Colors.black
            //                     )
            //                   ),
            //                   color: mainGray,
            //                   borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
            //                 ),
            //                 child: SingleChildScrollView(
            //                   child: Column(
            //                     children: accidentTypeList.map((accidentType) => ListTile(
            //                       title: Text(accidentType),
            //                       onTap: () {
            //                         dropdown.selectedAccidentType = accidentType;
            //                         dropdown.isClickedType = !dropdown.isClickedType;
            //                       },
            //                     )).toList(),
            //                   ),
            //                 ),
            //               )
            //             ],
            //           )
            //               : SizedBox(),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "사고 종류",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontFamily: 'nanumRegular'
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: mainGray
                    ),
                    width: size.width*0.893,

                    child: DropdownButton(
                      menuMaxHeight: 300,
                      isExpanded: true,
                      dropdownColor: mainGray,
                      itemHeight: 50,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      hint: Text(
                        "사고 종류를 선택해 주세요.",
                        style: TextStyle(
                            color: Color(0xff000000),
                            fontFamily: 'nanumRegular'
                        ),
                      ),
                      value: dropdown.selectedAccidentType,
                      onChanged: (String? newValue){
                        dropdown.selectedAccidentType = newValue!;
                      },
                      items: accidentTypeList.map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20,top: 20),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "보험 담보 종류",
            //         style: TextStyle(
            //             fontWeight: FontWeight.w700,
            //             fontSize: 16,
            //             fontFamily: 'nanumRegular'
            //         ),
            //       ),
            //       Stack(
            //         children: [
            //           Container(
            //             width: size.width*0.893,
            //             height: 50,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 color: mainGray
            //             ),
            //             child: Padding(
            //               padding: const EdgeInsets.only(right: 20,left: 20),
            //               child: Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   textRegular(dropdown.selectedInsuranceCoverageType, 16, FontWeight.w400, "nanumRegular"),
            //                   IconButton(
            //                       icon: Icon(FontAwesomeIcons.arrowDown),
            //                       onPressed: (){
            //                         dropdown.isClickedSite = !dropdown.isClickedSite;
            //                       }
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //           dropdown.isClickedSite ?
            //           Column(
            //             children: [
            //               SizedBox(height: 47,),
            //               Container(
            //                 width: size.width*0.893,
            //                 height: 200,
            //                 decoration: BoxDecoration(
            //                   boxShadow: [
            //                     BoxShadow(
            //                       color: Colors.grey.withOpacity(0.5),
            //                       spreadRadius: 2,
            //                       blurRadius: 3,
            //                       offset: Offset(2, 10), // changes position of shadow// changes position of shadow
            //                     )
            //                   ],
            //                   border: Border(
            //                     top: BorderSide(
            //                         color: Colors.black,
            //                         width: 1
            //                     ),
            //                   ),
            //                   color: mainGray,
            //                   borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
            //                 ),
            //                 child: SingleChildScrollView(
            //                   child: Column(
            //                     children: insuranceCoverageType.map((_accidentSite) => ListTile(
            //                       title: Text(_accidentSite),
            //                       onTap: () {
            //                         dropdown.selectedInsuranceCoverageType = _accidentSite;
            //                         dropdown.isClickedSite = !dropdown.isClickedSite;
            //                       },
            //                     )).toList(),
            //                   ),
            //                 ),
            //               )
            //             ],
            //           )
            //               : SizedBox(),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "보험 담보 종류",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontFamily: 'nanumRegular'
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: mainGray
                    ),
                    width: size.width*0.893,

                    child: DropdownButton(
                      menuMaxHeight: 300,
                      isExpanded: true,
                      dropdownColor: mainGray,
                      itemHeight: 50,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      hint: Text(
                        "보험 담보 종류를 선택해 주세요.",
                        style: TextStyle(
                            color: Color(0xff000000),
                            fontFamily: 'nanumRegular'
                        ),
                      ),
                      value: dropdown.selectedInsuranceCoverageType,
                      onChanged: (String? newValue){
                        dropdown.selectedInsuranceCoverageType = newValue!;
                      },
                      items: insuranceCoverageType.map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "사고 지역",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontFamily: 'nanumRegular'
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: mainGray
                    ),
                    width: size.width*0.893,

                    child: DropdownButton(
                      menuMaxHeight: 300,
                      isExpanded: true,
                      dropdownColor: mainGray,
                      itemHeight: 50,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      hint: Text(
                        "사고 지역을 선택해 주세요.",
                        style: TextStyle(
                            color: Color(0xff000000),
                            fontFamily: 'nanumRegular'
                        ),
                      ),
                      value: dropdown.selectedAccidentSite,
                      onChanged: (String? newValue){
                        dropdown.selectedAccidentSite = newValue!;
                      },
                      items: accidentSite.map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 20,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "사고 내용",
                    style: TextStyle(
                      fontFamily: 'nanumBold',
                      fontWeight: FontWeight.w700,
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: size.width*0.893,
                    height: 140,
                    decoration: BoxDecoration(
                      color: mainGray,
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: TextField(
                      controller: accidentDetailController,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: "사고 내용을 입력해 주세요.",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ),
            Padding(
                padding: EdgeInsets.only(left: 25, top: 20,right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "상담 질문하기",
                      style: TextStyle(
                          fontFamily: 'nanumBold',
                          fontWeight: FontWeight.w700,
                          fontSize: 16
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: size.width*0.893,
                      height: 140,
                      decoration: BoxDecoration(
                        color: mainGray,
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: TextField(
                        controller: consultingController,
                        maxLines: 6,
                        decoration: InputDecoration(
                          hintText: "상담 내용을 입력해 주세요.",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 20,),
                  child: SizedBox(
                      width: size.width*0.426,
                      height: 50,
                      child: ButtonTheme(
                        minWidth: size.width*0.423,//버튼의 최소 가로 길이
                        height: 50,//버튼의 세로 길이
                        shape: RoundedRectangleBorder( //버튼을 둥글게 처리
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                          color: mainRed,
                          onPressed: () {
                            navi na = navi(context: context, moveWidget: complete());
                            // AddAccident accdient = AddAccident(
                            //     userName: "홍길동",
                            //     userId: "A0001",
                            //     accidentType: dropdown.selectedAccidentTypeS,
                            //     coverageType: dropdown.selectedInsuranceCoverageTypeS,
                            //     accidentSite: dropdown.selectedAccidentSite,
                            //     description: accidentDetailController.text,
                            //     question: consultingController.text);
                            // accdient.addTest();
                            // accdient.addAccident();
                            AccidentDetail ad = AccidentDetail();
                            ad.addAccident(
                                dropdown.selectedAccidentTypeS.toString(),
                                dropdown.selectedInsuranceCoverageTypeS.toString(),
                                dropdown.selectedAccidentSiteS.toString(),
                                accidentDetailController.text,
                                consultingController.text
                            );
                            na.changeView();
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
                ),
                SizedBox(width: size.width*0.0347,),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: button1(size.width*0.426, 50, 10, "전화 상담 하기", mainBlack, home(), context),
                ),
              ],
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
      bottomNavigationBar: BottomNavi(context)
      // Container(
      //   color: Color(0xff1B1B1B),
      //   height: 100,
      //   width: double.maxFinite,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       ElevatedButton(
      //           style: ButtonStyle(
      //               minimumSize: MaterialStateProperty.all(Size(150, 50)),
      //               backgroundColor: MaterialStateProperty.all(mainRed)
      //           ),
      //           onPressed: (){
      //             Navigator.of(context).pop();
      //           },
      //           child: Text(
      //             "홈화면",
      //             style: TextStyle(
      //                 color: Colors.white
      //             ),
      //           )
      //       ),
      //       ElevatedButton(
      //           style: ButtonStyle(
      //               minimumSize: MaterialStateProperty.all(Size(150, 50))
      //           ),
      //           onPressed: (){
      //
      //           },
      //           child: Text(
      //             "나의 알림사고\n확인하기!",
      //             style: TextStyle(
      //                 color: Colors.black
      //             ),
      //             textAlign: TextAlign.center,
      //           )
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}