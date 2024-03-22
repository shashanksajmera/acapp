import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData{
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> createUser(String? uid) async{
    String? displayName = FirebaseAuth.instance.currentUser?.displayName;
    List<String>? name = displayName?.split(' ');
    Map<String,dynamic> user = {
      'studentname' : displayName,
      'firstname' : name![0],
      'lastname' : name[1],
      'email': FirebaseAuth.instance.currentUser?.email,
      'role': 'Guest',
      'uid': uid,
    };
    await firestore.collection('Users').doc(uid).set(user);
  }
  void updateUser(String? uid,String fieldName,dynamic val){
    firestore.collection("Users").doc(uid).update({
      fieldName : val
    });
  }
}