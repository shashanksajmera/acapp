import 'package:ajmeraclassesapp/widgets/assignmentcard.dart';
import 'package:flutter/material.dart';

class Worksheets extends StatefulWidget {
  const Worksheets({Key? key}) : super(key: key);

  @override
  State<Worksheets> createState() => _WorksheetsState();
}

class _WorksheetsState extends State<Worksheets> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Worksheets'),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth*0.025),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context,index){
              var submitted = index >4 ? false : true ;
              return AssignmentCard(isSubmitted: submitted,);
            }),
      ),
    );
  }
}
