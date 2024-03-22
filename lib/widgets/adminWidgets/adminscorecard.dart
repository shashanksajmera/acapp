import 'package:ajmeraclassesapp/screens/admin/editTest.dart';
import 'package:flutter/material.dart';

import '../../model/test.dart';

class AdminScoreCard extends StatelessWidget {
  final Test test;
  final String? intent;
  const AdminScoreCard({super.key,required this.test,this.intent = 'show'});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return IntrinsicHeight(
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditTestScore(test: test)));
        },
        child: Container(
          margin: EdgeInsets.only(top: screenWidth * 0.025),
          padding: EdgeInsets.all(screenWidth * 0.025),
          width: screenWidth * 0.95,
          decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius:
              BorderRadius.all(Radius.circular(screenWidth * 0.05 / 4))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    test.testCode, // ICse + 10 class + 0 for Maths + 01 for test number
                    style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.16)?.copyWith(
                      fontWeight: FontWeight.w500,
                        color: colorScheme.onPrimary,
                        ),
                  ),
                  Text(
                    test.testType,
                    style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.16)?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: colorScheme.onPrimary,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: screenWidth * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(test.date,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onPrimary,
                      )),
                  Text('Test Type',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onPrimary,
                      )),
                ],
              ),
              SizedBox(
                height: screenWidth * 0.012,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenWidth*0.32,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Subject Name',
                            style: textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onPrimary,
                            )),
                        SizedBox(
                          height: screenWidth * 0.004,
                        ),
                        Text(test.subject,
                            style: textTheme.titleMedium?.copyWith(
                                color: colorScheme.onPrimary,fontWeight: FontWeight.lerp(
                                FontWeight.w500, FontWeight.w600, 0.45)
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: screenWidth*0.275,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Maximum Marks',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: colorScheme.onPrimary,
                            )),
                        SizedBox(
                          height: screenWidth * 0.004,
                        ),
                        Text(test.maxMarks,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: colorScheme.onPrimary,fontWeight: FontWeight.lerp(
                                FontWeight.w500, FontWeight.w600, 0.45)
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: screenWidth*0.275,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Avg Marks',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onPrimary,
                          ),
                          textAlign: TextAlign.right,),
                        SizedBox(
                          height: screenWidth * 0.004,
                        ),
                        Text((test.avgMarks == -1.0) ? 'NA' : '${test.avgMarks}',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: colorScheme.onPrimary,fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.right,),
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
