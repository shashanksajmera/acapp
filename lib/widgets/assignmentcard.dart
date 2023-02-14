import 'package:flutter/material.dart';

class AssignmentCard extends StatefulWidget {
  const AssignmentCard({Key? key, this.isSubmitted = false}) : super(key: key);
  final bool isSubmitted;

  @override
  State<AssignmentCard> createState() => _AssignmentCardState();
}

class _AssignmentCardState extends State<AssignmentCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme =Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.only(left: screenWidth * 0.025,top: screenWidth*0.01,bottom: screenWidth*0.01),
      margin: EdgeInsets.only(top: screenWidth * 0.025),
      width: screenWidth * 0.92,
      height: screenWidth * 0.4,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius:
              BorderRadius.all(Radius.circular(screenWidth * 0.05 / 4))),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const Icon(
              //   Icons.assignment_outlined,
              //   size: 20,
              // ),
              Text(
                'Electricity and Magnetism',
                style: textTheme.titleLarge,
              ),
              SizedBox(
                width: screenWidth * 0.04,
              ),
              Container(
                // padding: EdgeInsets.symmetric(horizontal:screenWidth*0.003),
                width: screenWidth * 0.3,
                height: screenWidth * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(screenWidth * 0.025 * 3 / 4)),
                    color:
                        widget.isSubmitted ? Color(0xFF005D14) : Color(0xFF93000A)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.isSubmitted ? 'Submitted' : 'Not Submitted',
                      textAlign: TextAlign.center,
                      style: textTheme.titleMedium?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              // IconButton(padding:EdgeInsets.zero,onPressed: () {}, icon: Icon(Icons.arrow_forward_ios),iconSize: 16,splashRadius: 16,)
            ],
          ),
          SizedBox(
            height: screenWidth*0.02,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const Icon(
              //   Icons.assignment_outlined,
              //   size: 20,
              // ),
              Text(
                'Submit on - DD/MM/YYYY',
                style: textTheme.titleLarge,
              ),
              SizedBox(
                width: screenWidth * 0.04,
              ),
              ElevatedButton(onPressed: () {}, child: Text('Check it out'),style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,

                minimumSize: Size.zero
              ),)
              // IconButton(padding:EdgeInsets.zero,onPressed: () {}, icon: Icon(Icons.arrow_forward_ios),iconSize: 16,splashRadius: 16,)
            ],
          ),
        ],
      ),
    );
  }
}
