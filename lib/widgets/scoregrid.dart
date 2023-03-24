import 'package:ajmeraclassesapp/widgets/scorecard.dart';
import 'package:flutter/material.dart';

class ScoreGrid extends StatelessWidget {
  const ScoreGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
        // height: screenWidth * 0.54,
        // margin: EdgeIsnsets.only(top: screenWidth * 0.0375),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ScoreCard(),
            ScoreCard(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
              child: Text(
                'Check out all your scores',
                style: textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary ),
              ),
            )
          ],
        ),
        );
  }
}
