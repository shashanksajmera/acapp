import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return IntrinsicHeight(
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
                  'IC10101', // ICse + 10 class + 0 for Maths + 01 for test number
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: colorScheme.onPrimary,
                      fontWeight: FontWeight.lerp(
                          FontWeight.w500, FontWeight.w600, 0.45)),
                ),
                Text(
                  'TERM',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
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
                Text('22 March 2023',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onPrimary,
                        )),
                Text('Test Type',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                Container(
                  width: screenWidth*0.32,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Subject Name',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: colorScheme.onPrimary,
                              )),
                      SizedBox(
                        height: screenWidth * 0.004,
                      ),
                      Text('Physics',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onPrimary,fontWeight: FontWeight.lerp(
                              FontWeight.w500, FontWeight.w600, 0.45)
                          )),
                    ],
                  ),
                ),
                Container(
                  width: screenWidth*0.275,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Maximum Marks',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: colorScheme.onPrimary,
                              )),
                      SizedBox(
                        height: screenWidth * 0.004,
                      ),
                      Text('30',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onPrimary,fontWeight: FontWeight.lerp(
                              FontWeight.w500, FontWeight.w600, 0.45)
                          )),
                    ],
                  ),
                ),
                Container(
                  width: screenWidth*0.275,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Marks Scored',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: colorScheme.onPrimary,
                              ),
                      textAlign: TextAlign.right,),
                      SizedBox(
                        height: screenWidth * 0.004,
                      ),
                      Text('20',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onPrimary,fontWeight: FontWeight.lerp(
                              FontWeight.w500, FontWeight.w600, 0.45)
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
    );
  }
}
