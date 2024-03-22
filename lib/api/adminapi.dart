import 'dart:io';

import 'package:ajmeraclassesapp/model/test.dart';
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

  static Future<List<Test>> fetchallTests() async{
    print("Inside");
    List<Test> tests = [];
    var testData = await firestore.collection('Tests').get().then((snapshot) => snapshot.docs);
    for(var test in testData){
      var scores = await firestore.collection("Tests").doc(test.id).collection('Scores').get().then((snapshot)=>snapshot.docs);
      double avgMarks = -1;
      if(scores.isNotEmpty){
        avgMarks = 0;
        for(int i=0;i<scores.length;i++){
          int marks = int.parse(scores[i].data()['marks']);
          // print(marks);
          // print(avgMarks);
          avgMarks = (avgMarks*i + marks)/(i+1);
        }
      }
      // print(avgMarks);
      var data = test.data();
      tests.add(Test(
          testType: data['Test Type'],
          subject: data['Subject'],
          testCode: test.id,
          date: data['Date'],
          avgMarks: avgMarks,
          maxMarks: data['Max Marks']?? '0'));
    }
    // print(tests);

    return tests.reversed.toList();
  }
}