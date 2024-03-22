import 'package:flutter/material.dart';

class ManageClass extends StatefulWidget {

  const ManageClass({super.key});

  @override
  State<ManageClass> createState() => _ManageClassState();
}

class _ManageClassState extends State<ManageClass> {
  late String grade;
  late String board;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var arguments = ModalRoute.of(context)?.settings.arguments as Map;
    grade = "${arguments["class"]}";
    board = arguments["board"];
    return Scaffold(
      appBar: AppBar(
        title: Text('$board Class $grade'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth*0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Container(
                margin: EdgeInsets.only(bottom: screenWidth*0.05),
                height: screenWidth*0.1,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      'Add Student',
                      style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7)?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary),
                    )),
              ),

              Container(
                margin: EdgeInsets.only(bottom: screenWidth*0.05),
                height: screenWidth*0.1,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/allstudents',arguments: {
                        'class' : grade,
                        'board' : board
                        // 'board' :
                      });
                    },
                    child: Text(
                      'Edit Student Info',
                      style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7)?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary),
                    )),
              ),

              Container(
                margin: EdgeInsets.only(bottom: screenWidth*0.05),
                height: screenWidth*0.1,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/showEditScores');
                    },
                    child: Text(
                      'Show/Edit Tests Scores',
                      style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7)?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(bottom: screenWidth*0.05),
                height: screenWidth*0.1,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/addtestscores');
                    },
                    child: Text(
                      'Add Scores',
                      style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7)?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(bottom: screenWidth*0.05),
                height: screenWidth*0.1,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/addassignment');
                    },
                    child: Text(
                      'Add Assignments',
                      style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7)?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(bottom: screenWidth*0.05),
                height: screenWidth*0.1,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/manage');
                    },
                    child: Text(
                      'Show All Assignments',
                      style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7)?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(bottom: screenWidth*0.05),
                height: screenWidth*0.1,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/manage');
                    },
                    child: Text(
                      'Verify Assignment Submissions',
                      style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7)?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
