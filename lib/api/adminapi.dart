import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdminApi{
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;

  static void createTest(Map<String,dynamic> testData,String testCode){
    firestore.collection('Tests').doc(testCode).set(testData);
  }

  static Future<List<DocumentSnapshot>> fetchStudents(String board,String grade) async{
    var docs = await firestore.collection('Students').where('board',isEqualTo: board).where('class',isEqualTo: grade).get();
    return docs.docs;
  }
  static Future<List<DocumentSnapshot>> fetchStudentsfromCode(String board,String grade) async{
    var docs = await firestore.collection('Codes').where('board',isEqualTo: board).where('class',isEqualTo: grade).get();
    return docs.docs;
  }

  static void addTestScores(String code,String uid,String marks){
    firestore.collection('Tests').doc(code).collection('Scores').doc(uid).set({
      'marks' : marks
    });
  }

  static void saveScores(String code){
    firestore.collection('Tests').doc(code).update({'visible' : true});
  }

  static void saveAssignment(String code,Map<String,dynamic> data,File file,){
    firestore.collection('Assignments').doc(code).set(data);
    storage.ref().child('Worksheets/$code.pdf').putFile(file);
  }
}