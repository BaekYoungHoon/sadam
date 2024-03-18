import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sadam/controller/controller.dart';

Future<String> addMember(String? uid) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference members = firestore.collection('users');

  // 가장 최근 회원 코드 조회
  String lastMemberCode = await getLastMemberCode();

  // 새 회원 코드 생성
  String newMemberCode = generateNextCode(lastMemberCode);

  // Firestore에 새 회원 데이터 추가

  // members.doc(uid).update({
  //   "UserId" : newMemberCode
  // });
  return newMemberCode;
}

Future<String> getLastMemberCode() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  QuerySnapshot snapshot = await firestore
      .collection('users')
      .orderBy('UserId', descending: true)
      .limit(1)
      .get();

  if (snapshot.docs.isEmpty) {
    return 'A000'; // 첫 번째 회원 코드
  }

  return snapshot.docs.first.get('UserId');
}

String generateNextCode(String lastCode) {
  // 문자 부분과 숫자 부분을 분리합니다.
  String prefix = lastCode.substring(0, 1);
  int number = int.parse(lastCode.substring(1));

  if (number < 9999) {
    // 숫자 부분만 증가시킵니다.
    number++;
  } else {
    // 숫자 부분이 최대값에 도달하면 문자 부분을 증가시키고 숫자를 초기화합니다.
    if (prefix == 'Z') {
      // 'Z9999' 다음 코드를 생성할 로직이 필요합니다. 여기서는 예외 처리를 합니다.
      throw Exception('회원 코드가 최대값을 초과하였습니다.');
    } else {
      // 문자 부분을 다음 문자로 증가시킵니다.
      int prefixCode = prefix.codeUnitAt(0);
      prefix = String.fromCharCode(prefixCode + 1);
      number = 1; // 숫자를 '0001'로 초기화합니다.
    }
  }

  // 새 코드를 반환합니다. 숫자 부분을 4자리로 맞춥니다.
  return '$prefix${number.toString().padLeft(4, '0')}';
}

Future<String?> getSponsorId(String userName) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    // 'users' 컬렉션에서 'UserName' 필드가 userName 변수와 일치하는 도큐먼트를 찾습니다.
    QuerySnapshot querySnapshot = await firestore
        .collection('users')
        .where('UserName', isEqualTo: userName)
        .get();

    // 쿼리 결과에서 첫 번째 도큐먼트를 가져옵니다.
    if (querySnapshot.docs.isNotEmpty) {
      var document = querySnapshot.docs.first;
      return document['UserId']; // 'UserId' 필드 값을 반환합니다.
    } else {
      // 일치하는 도큐먼트가 없는 경우
      print("해당하는 UserName을 가진 사용자를 찾을 수 없습니다.");
      return null;
    }
  } catch (e) {
    // 에러 처리
    print("Error getting user document: $e");
    return null;
  }
}
