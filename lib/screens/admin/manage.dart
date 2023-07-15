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
          title: Text('Manage Students'),
      ),
        body: Column(
          children: [
            TabBar(
                tabs: <Tab>[
              Tab(
                // text: 'Regular',
                child: Text(
                  'ICSE',
                  style: textTheme.titleMedium,
                ),
              ),
              Tab(
                // text: 'Regular',
                child: Text(
                  'CBSE',
                  style: textTheme.titleMedium,
                ),
              ),
              Tab(
                child: Text(
                  'Competitive',
                  style: textTheme.titleMedium,
                ),
              )
            ]),
            SizedBox(
                height: screenWidth*0.03
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(screenWidth*0.05),
                child: TabBarView(children: [
                  ListView(
                    children: [
                      for(int i=0;i<classes.length;i++)
                        ClassTile(grade: classes[i],board: 'ICSE',),

                    ],
                  ),
                  ListView(
                    children: [
                      for(int i=0;i<classes.length;i++)
                        ClassTile(grade: classes[i],board: 'CBSE',),

                    ],
                  ),
                  ListView(
                    children: [
                      for(int i=0;i<classes.length;i++)
                        ClassTile(grade : classes[i],board: 'COMP',),

                    ],
                  )
                ]),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
