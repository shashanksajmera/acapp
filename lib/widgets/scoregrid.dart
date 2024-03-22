import 'package:ajmeraclassesapp/widgets/adminWidgets/adminscorecard.dart';
import 'package:ajmeraclassesapp/widgets/scorecard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/adminapi.dart';
import '../api/student-api.dart';
import '../model/test.dart';
import '../model/user.dart';

class ScoreGrid extends StatefulWidget {
  const ScoreGrid({super.key});

  @override
  State<ScoreGrid> createState() => _ScoreGridState();
}

class _ScoreGridState extends State<ScoreGrid> {
  List<Test> adminscores = [];
  List<Map<String,dynamic>> scores = [];
  Map<String, dynamic>? user = {};
  bool loading = false;
  void getData(String? uid) async {

    if(user?['role'] == 'Admin'){
      adminscores = await AdminApi.fetchallTests();
      // print(adminscores);
      setState(() {
        adminscores;
        loading = true;
      });
    }
    else {
      List<Map<String, dynamic>> scores2 = await StudentApi.getScores(uid, 2);
      setState(() {
        scores = scores2;
        loading = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
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
    // print(user);
    double screenWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;
    return !loading ? Container() : Container(
        // height: screenWidth * 0.54,
        // margin: EdgeIsnsets.only(top: screenWidth * 0.0375),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            (user?['role'] == 'Admin') ? AdminScoreCard(test: adminscores[0],) : const ScoreCard(),
            (user?['role'] == 'Admin') ? AdminScoreCard(test: adminscores[1],) : const ScoreCard(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/scores');
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
              child: Text(
                (user?['role'] == 'Admin') ? 'Check all Tests Stats' : 'Check out all your scores',
                style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7)?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary),
              ),
            )
          ],
        ),
        );
  }
}
