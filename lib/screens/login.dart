import 'package:ajmeraclassesapp/auth/login.dart';
import 'package:ajmeraclassesapp/model/user.dart';
import 'package:ajmeraclassesapp/api/userdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top:screenWidth * 0.1,left:screenWidth * 0.05,right: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Image(image: AssetImage('assets/logo-2.png')),
            SizedBox(
              height: screenWidth * 0.05,
            ),
            Text(
              'Welcome to',
              textAlign: TextAlign.center,
              style: textTheme.headlineLarge!.copyWith(color: Colors.white),
            ),
            SizedBox(
              height: screenWidth * 0.025,
            ),
            Text(
              'Ajmera Classes',
              textAlign: TextAlign.center,
              style: textTheme.headlineLarge!.copyWith(color: Colors.white),
            ),
            SizedBox(
              height: screenWidth * 0.125,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
                onPressed: () async {
                  UserCredential user = await auth.signInWithGoogle(context);
                  final currentUser = FirebaseAuth.instance.currentUser;
                  DocumentSnapshot doc = await FirebaseFirestore.instance.collection('Users').doc(currentUser?.uid).get();
                  if(!doc.exists) {
                    UserData().createUser(currentUser?.uid);
                  }
                  final userData = doc.data() as Map<String,dynamic>;
                  if(context.mounted){
                    // print("Context Mounted Error");
                  }
                  Provider.of<CurrentUserData>(context,listen: false).setCurrentUser(userData);
                  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                  // Navigator.popAndPushNamed(context, '/');
                },
                child: Text('Sign in',
                  style: textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                )),
          ],
        ),
      )),
    );
  }
}
