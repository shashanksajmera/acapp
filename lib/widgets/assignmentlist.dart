import 'package:ajmeraclassesapp/widgets/assignmentcard.dart';
import 'package:flutter/material.dart';

class AssignmentList extends StatefulWidget {
  const AssignmentList({Key? key}) : super(key: key);

  @override
  State<AssignmentList> createState() => _AssignmentListState();
}

class _AssignmentListState extends State<AssignmentList> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme =Theme.of(context).textTheme;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AssignmentCard(),AssignmentCard(isSubmitted: true,),AssignmentCard(),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
            child: Text(
              'Check out all Assignments',
              style: textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
            ),
          )
        ],
      ),
    );
  }
}
