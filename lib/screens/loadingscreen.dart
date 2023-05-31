import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/userdata.dart';
import '../model/user.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> checkLogin() async {

    var currentUser = FirebaseAuth.instance.currentUser;
    print(currentUser);
    // Navigator.popAndPushNamed(context, '/login');

    if(currentUser?.uid !=null){
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection('Users').doc(currentUser?.uid).get();
      final userData = doc.data() as Map<String,dynamic>;
      Provider.of<CurrentUserData>(context,listen: false).setCurrentUser(userData);
      Timer(Duration(seconds: 3), () {
        Navigator.pushNamedAndRemoveUntil(context, '/',(route)=>false);
      });

    }
    else{
      Timer(Duration(seconds: 3), () {
        Navigator.popAndPushNamed(context, '/login');
      });

    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
  }
  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          Image.asset('assets/logo.png')
        ],
      )),
    );
  }
}
