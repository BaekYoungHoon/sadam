import 'package:flutter/material.dart';
import 'package:sadam/data/colors.dart';
import 'package:sadam/data/faq.dart';
import 'package:sadam/navi/bottom_navi.dart';
import 'package:sadam/widget/expansion.dart';
import 'package:sadam/widget/text.dart';
import 'package:sadam/controller/controller.dart';
import 'package:provider/provider.dart';
import 'package:sadam/provider/expansion.dart';

class FAQ extends StatelessWidget {
  const FAQ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: textRegular("FAQ", 18, FontWeight.w700, 'nanumBold'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: faqController,
              decoration: InputDecoration(
                filled: true,
                fillColor: mainGray,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    size: 40,
                  ),
                  onPressed: (){
                    String searchText = faqController.text;
                    print(searchText);
                  },
                )
              ),
            ),
            SizedBox(height: 30,),
            textRegular("자주 묻는 질문", 16, FontWeight.w700, 'nanumBold'),
            SizedBox(height: 10,),
            expansionTile(question[0], answer[0], context),
            SizedBox(height: 15,),
            expansionTile(question[1], answer[1], context),
            SizedBox(height: 15,),
            expansionTile(question[2], answer[2], context),
            SizedBox(height: 15,),
            expansionTile(question[3], answer[3], context),
            SizedBox(height: 15,),
            expansionTile(question[4], answer[4], context),
            SizedBox(height: 15,),
            expansionTile(question[5], answer[5], context),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavi(context),
    );
  }
}
