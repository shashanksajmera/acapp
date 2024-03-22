import 'package:flutter/material.dart';

import '../../api/adminapi.dart';
import '../../model/test.dart';
import '../../widgets/adminWidgets/adminscorecard.dart';

class ShowEditScores extends StatefulWidget {
  const ShowEditScores({super.key});

  @override
  State<ShowEditScores> createState() => _ShowEditScoresState();
}

class _ShowEditScoresState extends State<ShowEditScores> {
  List<Test> adminscores = [];
  Future<void> getData() async {
    adminscores = await AdminApi.fetchallTests();
    print(adminscores);
    setState(() {
      adminscores;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Show/Edit Scores'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical:screenWidth*0.015,horizontal: screenWidth*0.04),
        child: ListView.builder(
            itemCount: adminscores.length ,
            itemBuilder: (context,index){
              return AdminScoreCard(test: adminscores[index]);
            }),
      ),
    );
  }
}
