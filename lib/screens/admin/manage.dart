import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/user.dart';
import '../../widgets/adminWidgets/classtile.dart';

class ManageStudents extends StatefulWidget {
  const ManageStudents({super.key});

  @override
  State<ManageStudents> createState() => _ManageStudentsState();
}

class _ManageStudentsState extends State<ManageStudents> {
  List<int> classes = [10,9,8,7,6,5];
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? user =
        Provider.of<CurrentUserData>(context).currentUser;
    double screenWidth = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Manage Students'),
          bottom: TabBar(
            labelStyle: TextStyle.lerp(textTheme.titleMedium, textTheme.titleSmall, 0.3),
            labelColor: colorScheme.onBackground,
            unselectedLabelStyle: TextStyle.lerp(textTheme.titleMedium, textTheme.titleSmall, 0.3),
            unselectedLabelColor: colorScheme.onBackground.withOpacity(0.7),
            indicatorWeight: 3.0,
            indicatorSize: TabBarIndicatorSize.tab,
              tabs: const <Tab>[
                Tab(
                  text: 'ICSE',
                  // child: Text(
                  //   'ICSE',
                  //   style: textTheme.titleMedium,
                  // ),
                ),
                Tab(
                  text: 'CBSE',
                ),
                Tab(
                  text: 'Competitive',

                )
              ]),
      ),
        body: Column(
          children: [
            // TabBar(
            //     tabs: <Tab>[
            //   Tab(
            //     // text: 'Regular',
            //     child: Text(
            //       'ICSE',
            //       style: textTheme.titleMedium,
            //     ),
            //   ),
            //   Tab(
            //     // text: 'Regular',
            //     child: Text(
            //       'CBSE',
            //       style: textTheme.titleMedium,
            //     ),
            //   ),
            //   Tab(
            //     child: Text(
            //       'Competitive',
            //       style: textTheme.titleMedium,
            //     ),
            //   )
            // ]),
            // SizedBox(
            //     height: screenWidth*0.03
            // ),
            Expanded(
                // padding: EdgeInsets.symmetric(vertical :screenWidth*0.05),
                child: TabBarView(children: [
                  ListView(
                    children: [
                      SizedBox(
                        height: screenWidth*0.05,
                      ),
                      for(int i=0;i<classes.length;i++)
                        ClassTile(grade: classes[i],board: 'ICSE',),

                    ],
                  ),
                  ListView(
                    children: [
                      SizedBox(
                        height: screenWidth*0.05,
                      ),
                      for(int i=0;i<classes.length;i++)
                        ClassTile(grade: classes[i],board: 'CBSE',),

                    ],
                  ),
                  ListView(
                    children: [
                      SizedBox(
                        height: screenWidth*0.05,
                      ),
                      for(int i=0;i<classes.length;i++)
                        ClassTile(grade : classes[i],board: 'COMP',),

                    ],
                  )
                ]),
              ),

          ],
        ),

      ),
    );
  }
}
