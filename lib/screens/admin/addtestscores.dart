import 'package:flutter/material.dart';

class AddTestScores extends StatefulWidget {
  const AddTestScores({super.key});

  @override
  State<AddTestScores> createState() => _AddTestScoresState();
}

class _AddTestScoresState extends State<AddTestScores> {
  String classValue = 'Class 10';
  String board = "ICSE";
  String? subject = "Maths";

  List<String> classes = ['Class 10', 'Class 9', 'Class 8', 'Class 7', 'Class 6', 'Class 5'];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Test Scores'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Class',
                    style: textTheme.titleLarge,
                  ),
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.025),
                    width: screenWidth * 0.26,
                    height: screenWidth * 0.1,
                    decoration: BoxDecoration(
                        color: colorScheme.primary,
                        borderRadius: BorderRadius.all(
                            Radius.circular(screenWidth * 0.0125))),
                    child: DropdownButton<String>(
                      // alignment: AlignmentDirectional.bottomCenter,
                      // alignment: AlignmentDirectional.topStart,
                      dropdownColor: colorScheme.primary,
                      // hint: Text('Select Class'),
                      value: classValue,
                      iconEnabledColor: colorScheme.onPrimary,
                      // icon: Icon(
                      //   Icons.arrow_downward,
                      //   color: colorScheme.onPrimary,
                      // ),
                      // iconSize:15,
                      // elevation: 0,
                      style: textTheme.titleMedium
                          ?.copyWith(color: colorScheme.onPrimary),
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String? newValue) {
                        classValue = newValue!;
                        setState(() {
                          classValue;
                          print(classValue);
                        });
                      },
                      items:
                          classes.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenWidth * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // color: colorScheme.primary,
                    child: Text(
                      'Board',
                      style: textTheme.titleLarge,
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.1,
                    padding: EdgeInsets.zero,
                    // color: colorScheme.primary,
                    child: Row(
                      children: [
                        Radio<String>(
                          // title: Text("ICSE"),
                          value: "ICSE",
                          groupValue: board,
                          onChanged: (value) {
                            setState(() {
                              board = value!;
                            });
                          },
                          // contentPadding: EdgeInsets.zero,
                        ),
                        Text(
                          "ICSE",
                          style: textTheme.titleMedium,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.1,
                    child: Row(
                      children: [
                        Radio<String>(
                          // title: Text("CBSE"),
                          value: "CBSE",
                          groupValue: board,
                          onChanged: (value) {
                            setState(() {
                              board = value!;
                            });
                          },
                          // contentPadding: EdgeInsets.zero,
                        ),
                        Text(
                          "CBSE",
                          style: textTheme.titleMedium,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



