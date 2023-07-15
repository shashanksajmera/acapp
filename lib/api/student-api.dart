import 'package:cloud_firestore/cloud_firestore.dart';

class StudentApi{
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map<String,dynamic> student={};
  
  String? getStudentCode(String? studentName){
    String? code;
    firestore.collection('StudentCodes').where('studentName', isEqualTo: studentName).limit(1).get().then((query){
      DocumentSnapshot doc = query.docs[0];
      code = doc['code'];
    });
    return code;
  }
  static void saveStudent(Map<String,String> data){
    firestore.collection('Codes').doc(data['code']).set(data);
  }
  
  void createStudent(String? uid, Map<String,dynamic> data){
    student = data;
    DocumentReference studentData = firestore.collection('Students').doc(uid);
    studentData.set(student);
  }

  List<Map<String,dynamic>> getScores(String? uid,bool latest){
    List<Map<String,dynamic>> scores = [];
    DocumentReference studentData = firestore.collection('Students').doc(uid);
    // studentData.collection('Scores')
    return scores;
  }
}