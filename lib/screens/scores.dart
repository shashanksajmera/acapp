import 'package:ajmeraclassesapp/widgets/scorecard.dart';
import 'package:flutter/material.dart';

class Scores extends StatefulWidget {
  const Scores({Key? key}) : super(key: key);

  @override
  State<Scores> createState() => _ScoresState();
}

class _ScoresState extends State<Scores> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scores'),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth*0.025),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context,index){
          return ScoreCard();
        }),
      ),
    );
  }
}
