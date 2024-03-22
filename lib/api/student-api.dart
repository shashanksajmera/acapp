import 'package:cloud_firestore/cloud_firestore.dart';

class StudentApi{
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map<String,dynamic> student={};

  static Future<Map<String, dynamic>?> getStudentDatafromCode(String? code) async {
    Map<String ,dynamic>? studentdata;
    await firestore.collection('Codes').doc(code).get().then((doc){
      // print(doc.data());
      studentdata = doc.data();
    }
    );
    return studentdata;
  }
  static void saveStudent(Map<String,String> data){
    firestore.collection('Codes').doc(data['code']).set(data);
  }
  
  static void createStudent(String? uid, Map<String,dynamic> data){
    // this.student = data;
    DocumentReference studentData = firestore.collection('Students').doc(uid);
    studentData.set(data);
  }

  static Future<List<Map<String, dynamic>>> getScores(String? uid,int limit) async {
    List<Map<String,dynamic>> scores = [];
    DocumentReference studentData = firestore.collection('Students').doc(uid);
    var scoreData = await studentData.collection('Scores').get().then((snapshot) => snapshot.docs);
    for (var doc in scoreData) {
      var data = doc.data();
      scores.add(data);
    }
    return scores;
  }
  static Future<Map<String, dynamic>?> getStudentData(String? uid) async{
    // print('Uid $uid');
    Map<String ,dynamic>? studentdata;
    await firestore.collection('Students').doc(uid).get().then((doc){
      // print(doc.data());
      studentdata = doc.data();
    }
    );
    return studentdata;
}
  static Future<bool> checkStudent(String uid) async {
    bool isStudent = await firestore.collection('Students').doc(uid).get().then((doc) => doc.exists);
   return isStudent;
  }

}