import 'package:ajmeraclassesapp/widgets/assignmentlist.dart';
import 'package:ajmeraclassesapp/widgets/latestnotification.dart';
import 'package:flutter/material.dart';

import '../widgets/scoregrid.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print('$screenWidth+$height');
    TextTheme textTheme =Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Image(image: AssetImage('assets/logo-2.png'),
        width: 40,),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.person)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth*0.04,vertical:screenWidth*0.0025),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Hi User',
              style: textTheme.headlineMedium,),
              // SizedBox(
              //   height: screenWidth*0.0375,
              // ),
              const LatestNotification(),
              SizedBox(
                height: screenWidth*0.0375,
              ),
              const Text('Latest Scores',style: TextStyle(
                fontSize: 27,
                color: Colors.white
              ),),
              ScoreGrid(),
              SizedBox(
                height: screenWidth*0.0375,
              ),
              Container(
                margin: EdgeInsets.only(bottom: screenWidth * 0.0125),
                child: const Text('Latest Assignments',style: TextStyle(
                    fontSize: 27,
                    color: Colors.white
                ),),
              ),
              AssignmentList()
            ],
          ),
        ),
      ),
    );
  }
}
