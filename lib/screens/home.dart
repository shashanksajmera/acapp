import 'package:ajmeraclassesapp/model/user.dart';
import 'package:ajmeraclassesapp/widgets/assignmentlist.dart';
import 'package:ajmeraclassesapp/widgets/latestnotification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/scoregrid.dart';
import 'login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget getQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.all(MediaQuery
              .of(context)
              .size
              .width * 0.025),
          width: MediaQuery
              .of(context)
              .size
              .width * 0.95,
          decoration: BoxDecoration(
              color: Theme
                  .of(context)
                  .colorScheme
                  .primary,
              borderRadius: BorderRadius.all(Radius.circular(
                  MediaQuery
                      .of(context)
                      .size
                      .width * 0.05 / 4))),
          child: Text(
            'Question\nQuestion line2',
            style: Theme
                .of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Theme
                .of(context)
                .colorScheme
                .onPrimary),
          ),
        ),
        SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .width * 0.02,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: Size.zero,
                textStyle: Theme
                    .of(context)
                    .textTheme
                    .titleMedium,
                padding: EdgeInsets.all(
                    MediaQuery
                        .of(context)
                        .size
                        .width * 0.05 / 4)),
            onPressed: () {},
            child: const Text('Option A')),
        SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .width * 0.02,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: Size.zero,
                textStyle: Theme
                    .of(context)
                    .textTheme
                    .titleMedium,
                padding: EdgeInsets.all(
                    MediaQuery
                        .of(context)
                        .size
                        .width * 0.05 / 4)),
            onPressed: () {},
            child: const Text('Option A')),
        SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .width * 0.02,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                textStyle: Theme
                    .of(context)
                    .textTheme
                    .titleMedium,
                padding: EdgeInsets.all(
                    MediaQuery
                        .of(context)
                        .size
                        .width * 0.05 / 4)),
            onPressed: () {},
            child: const Text('Option A')),
        SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .width * 0.02,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                textStyle: Theme
                    .of(context)
                    .textTheme
                    .titleMedium,
                padding: EdgeInsets.all(
                    MediaQuery
                        .of(context)
                        .size
                        .width * 0.05 / 4)),
            onPressed: () {},
            child: const Text('Option A')),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? user = Provider
        .of<CurrentUserData>(context)
        .currentUser;
    // print(user!['firstname']);
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    // print('$screenWidth+$height');
    TextTheme textTheme = Theme
        .of(context)
        .textTheme;
    ColorScheme colorScheme = Theme
        .of(context)
        .colorScheme;
      return Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Image(
            image: AssetImage('assets/logo-2.png'),
            width: 40,
          ),
          elevation: 0,
          actions: [
            // IconButton(onPressed: () {}, icon: Icon(Icons.person)),
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
            PopupMenuButton(
              onSelected: (value) {
                // print(value);
                Navigator.pushNamed(context, value.toString());
              },
              itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: '/profile',
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: screenWidth * 0.02,),
                      Text('Profile'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: '/scores',
                  child: Row(
                    children: [
                      Icon(Icons.quiz),
                      SizedBox(width: screenWidth * 0.02,),
                      Text('Test Scores'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: '/worksheets',
                  child: Row(
                    children: [
                      Icon(Icons.assignment),
                      SizedBox(width: screenWidth * 0.02,),
                      Text('Assignments'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: '/refer',
                  child: Row(
                    children: [
                      Icon(Icons.group),
                      SizedBox(width: screenWidth * 0.02,),
                      Text('Refer a Friend'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: '/contact',
                  child: Row(
                    children: [
                      Icon(Icons.call),
                      SizedBox(width: screenWidth * 0.02,),
                      Text('Contact Us'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        // floatingActionButtonAnimator: ,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/messages');
          },
          child: Icon(Icons.message),
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04, vertical: screenWidth * 0.0025),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Hi ${user?['firstname']}",
                  style: textTheme.headlineMedium
                      ?.copyWith(color: colorScheme.onBackground),
                ),
                // SizedBox(
                //   height: screenWidth*0.0375,
                // ),
                const LatestNotification(),
                SizedBox(
                  height: screenWidth * 0.03,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: screenWidth * 0.0125),
                  child: const Text(
                    'Question of the Day',
                    style: TextStyle(fontSize: 27, color: Colors.white),
                  ),
                ),
                getQuestion(),
                SizedBox(
                  height: screenWidth * 0.03,
                ),
                const Text(
                  'Latest Scores',
                  style: TextStyle(fontSize: 27, color: Colors.white),
                ),
                ScoreGrid(),
                SizedBox(
                  height: screenWidth * 0.03,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: screenWidth * 0.0125),
                  child: const Text(
                    'Latest Assignments',
                    style: TextStyle(fontSize: 27, color: Colors.white),
                  ),
                ),
                AssignmentList(),

                // Container(
                //   padding: EdgeInsets.all(screenWidth*0.01),
                //   // color: Theme.of(context).colorScheme.onSecondary,
                //   decoration: BoxDecoration(
                //     color: Theme.of(context).colorScheme.onSecondary,
                //     borderRadius: BorderRadius.all(Radius.circular(screenWidth*0.02))
                //   ),
                //   margin: EdgeInsets.only(bottom: screenWidth * 0.0125),
                //   child: Column(
                //     children: [
                //       const Text('More about Ajmera Classes App',style: TextStyle(
                //           fontSize: 18,
                //           color: Color(0XFFFFB960)
                //       ),),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );

  }
}
