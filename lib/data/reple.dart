import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class RepleData {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<String>> getDocument(String uid) async {
    // 컬렉션 내의 모든 도큐먼트를 가져옵니다.
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await db
        .collection('users').doc(uid).collection('myAccident').orderBy("timeStamp", descending: true).get();

    // 각 도큐먼트의 이름을 추출하여 리스트에 추가합니다.
    List<String> documentNames = [];
    querySnapshot.docs.forEach((doc) {
      documentNames.add(doc.id);
    });

    // 도큐먼트 이름들을 반환합니다.
    return documentNames;
  }

  Future<void> setReple(String uid, String reple, Timestamp timestamp, String doc) async {
    await db
        .collection("users")
        .doc(uid)
        .collection("myAccident")
        .doc(doc)
        .collection("Reple")
        .doc()
        .set({
      'Reple': reple,
      'TimeStamp': timestamp
    });
  }

  Future<List<String>> getReple(String uid, String doc) async {
    List<String> reple = [];
    final dbget = await db
        .collection('users')
        .doc(uid)
        .collection('myAccident')
        .doc(doc)
        .collection('Reple')
        .orderBy('TimeStamp', descending: true);

    QuerySnapshot repleDoc = await dbget.get();

    if (repleDoc.docs.isNotEmpty) {
      for (QueryDocumentSnapshot doc in repleDoc.docs) {
        reple.add(doc.get("Reple"));
        print(reple);
      }
    }
    return reple;
  }

}