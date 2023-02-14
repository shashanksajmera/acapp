import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme =Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(right:screenWidth*0.05/2 ),
      // padding: EdgeInsets.all(screenWidth*0.05/4),
      width: screenWidth*0.65,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(screenWidth*0.05/4))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.zero,
            height: screenWidth*0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(screenWidth*0.05/4),topRight: Radius.circular(screenWidth*0.05/4)
              ),
              image: DecorationImage(
                image: AssetImage('assets/bg-test.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical:screenWidth*0.05/4,horizontal:screenWidth*0.025 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Subject - Physics',style: textTheme.titleLarge,),
                Text('Date of Test - DD/MM/YYYY',style: textTheme.titleLarge),
                Text('Electricity and Magnetism',style: textTheme.titleLarge),
                Text('You have scored XX/YY',style:textTheme.titleLarge)
              ],
            ),
          ),

        ],
      ),
    );
  }
}
