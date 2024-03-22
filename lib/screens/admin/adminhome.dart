
import 'package:ajmeraclassesapp/widgets/questionoftheday.dart';
import 'package:ajmeraclassesapp/widgets/scoregrid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../../model/assignment.dart';
import '../../model/user.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  List<int> classes = [10,9,8,7,6,5];
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? user =
        Provider.of<CurrentUserData>(context).currentUser;
    double screenWidth = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    // print(textTheme.titleMedium?.fontFamily!);
    return Scaffold(
      appBar: AppBar(
        title: const Image(
          image: AssetImage('assets/logo-2.png'),
          width: 40,
        ),
        elevation: 0,
        actions: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          PopupMenuButton(
            onSelected: (value) {
              // print(value);
              Navigator.pushNamed(context, value.toString());
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: '/profile',
                child: Row(
                  children: [
                    const Icon(Icons.person),
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                    const Text('Profile'),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: '/scores',
                child: Row(
                  children: [
                    const Icon(Icons.quiz),
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                    const Text('Test Scores'),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: '/worksheets',
                child: Row(
                  children: [
                    const Icon(Icons.assignment),
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                    const Text('Assignments'),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: '/refer',
                child: Row(
                  children: [
                    const Icon(Icons.group),
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                    const Text('Refer a Friend'),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: '/contact',
                child: Row(
                  children: [
                    const Icon(Icons.call),
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                    const Text('Contact Us'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/allchats');
        },
        // backgroundColor: colorScheme.primaryContainer,
        // foregroundColor: colorScheme.onPrimaryContainer,
        child: const Icon(Icons.message),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04, vertical: screenWidth * 0.0025),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Hi ${user?['firstname']}",
                style: TextStyle.lerp(textTheme.headlineMedium, textTheme.headlineSmall, 0.5)?.copyWith(fontWeight: FontWeight.w500)
              ),
              // SizedBox(
              //   height: screenWidth*0.0375,
              // ),
              // const LatestNotification(),
              SizedBox(
                height: screenWidth * 0.03,
              ),
              Container(
                margin: EdgeInsets.only(bottom: screenWidth * 0.0125),
                child: Text(
                  'Question of the Day',
                  style: TextStyle.lerp(textTheme.headlineMedium, textTheme.headlineSmall, 0.5)?.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              const QuestionOfTheDay(),
              SizedBox(
                height: screenWidth * 0.05,
              ),
             Text(
                'Admin Options',
                style: TextStyle.lerp(textTheme.headlineMedium, textTheme.headlineSmall, 0.5)?.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: screenWidth * 0.03,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    'Register New Student',
                    style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7)?.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/manage');
                  },
                  child: Text(
                    'Manage Students',
                    style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7)?.copyWith(
                        // fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.onSecondary),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/addtestscores');
                  },
                  child: Text(
                    'Add Test Scores',
                    style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7)?.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/addassignment');
                    // Navigator.push(context, new MaterialPageRoute(builder: (context) => Assignment(file: File('assets/sample2.pdf'))));
                  },
                  child: Text(
                    'Add Assignments',
                    style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7)?.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary),
                  )),
              SizedBox(
                height: screenWidth * 0.03,
              ),
              Text(
                'Latest Tests',
                style: TextStyle.lerp(textTheme.headlineMedium, textTheme.headlineSmall, 0.5)?.copyWith(fontWeight: FontWeight.w500)
              ),
              const ScoreGrid()
            ],
          ),
        ),
      ),
    );
  }
}
