import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class GetAccident {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<String>> getAccientList(String uid) async {
    List<String> documentsList = [];
    final dbget = await db
        .collection("users")
        .doc(uid)
        .collection("myAccident")
        .orderBy("timeStamp", descending: true);
    QuerySnapshot snapshot = await dbget.get();

    if (snapshot.docs.isNotEmpty) {
      for (QueryDocumentSnapshot doc in snapshot.docs) {
        documentsList.add(doc.get("accidentType"));
        print(documentsList);
      }
    }
    return documentsList;
  }

  Future<List<List<dynamic>>> getAccidentDetail(String uid) async {
    List<List<dynamic>> allDocumentFields = [];

    // Firestore에서 컬렉션 가져오기
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection("myAccident")
        .orderBy('timeStamp', descending: true)
        .get();

    // 컬렉션의 각 도큐먼트에서 전체 필드 값을 가져와서 리스트에 추가
    querySnapshot.docs.forEach((doc) {
      List<dynamic> docFields = [];
      Map<String, dynamic> data = doc.data()!;
      data.forEach((key, value) {
        // Timestamp 값을 DateTime으로 변환하여 추가
        if (value is Timestamp) {
          DateTime dateTime = value.toDate();
          String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(dateTime); // 포맷팅
          docFields.add(formattedDate.substring(0, 16));
        } else {
          docFields.add(value);
        }
      });
      allDocumentFields.add(docFields);
    });

    return allDocumentFields;
  }
}