import 'package:ajmeraclassesapp/api/adminapi.dart';
import 'package:ajmeraclassesapp/widgets/adminWidgets/adminscorecard.dart';
import 'package:ajmeraclassesapp/widgets/scorecard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/student-api.dart';
import '../model/test.dart';
import '../model/user.dart';

class Scores extends StatefulWidget {
  const Scores({super.key});

  @override
  State<Scores> createState() => _ScoresState();
}

class _ScoresState extends State<Scores> {
  List<Test> adminscores = [];
  List<Map<String,dynamic>> scores = [];
  Map<String, dynamic>? user = {};
  void getData(String? uid) async {

    if(user?['role'] == 'Admin'){
      adminscores = await AdminApi.fetchallTests();
      setState(() {
        adminscores;
      });
    }
    else {
      List<Map<String, dynamic>> scores2 = await StudentApi.getScores(uid, 2);
      setState(() {
        scores = scores2;
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      user = Provider.of<CurrentUserData>(context,listen: false).currentUser;
      // print(user);
      // checkStudent(user?['uid']);
      getData(user?['uid']);
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scores'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical:screenWidth*0.015,horizontal: screenWidth*0.04),
        child: ListView.builder(
            itemCount: (user?['role'] == 'Admin') ? adminscores.length : scores.length,
            itemBuilder: (context,index){
          return (user?['role'] == 'Admin') ? AdminScoreCard(test: adminscores[index]) : const ScoreCard();
        }),
      ),
    );
  }
}
