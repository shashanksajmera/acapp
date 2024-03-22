import 'package:ajmeraclassesapp/api/student-api.dart';
import 'package:ajmeraclassesapp/model/user.dart';
import 'package:ajmeraclassesapp/screens/admin/adminhome.dart';
import 'package:ajmeraclassesapp/widgets/assignmentlist.dart';
import 'package:ajmeraclassesapp/widgets/latestnotification.dart';
import 'package:ajmeraclassesapp/widgets/questionoftheday.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/login.dart';
import '../widgets/scoregrid.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isStudent = false;
  var codeCtrl = TextEditingController();
  FocusNode focus = FocusNode();

  void checkStudent(String uid) async {
    bool check = await StudentApi.checkStudent(uid);
    // print(uid);
    setState(() {
      isStudent = check;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Map<String, dynamic>? user =
          Provider.of<CurrentUserData>(context,listen: false).currentUser;
      checkStudent(user?['uid']);
      // getData(user?['uid']);
    });
  }

  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
    Map<String, dynamic>? user =
        Provider.of<CurrentUserData>(context).currentUser;

    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return (user!['role'] == 'Admin')
        ? const AdminHome()
        : isStudent
            ? Scaffold(
                // backgroundColor: Theme.of(context).colorScheme.background,
                appBar: AppBar(
                  title: const Image(
                    image: AssetImage('assets/logo-2.png'),
                    width: 40,
                  ),
                  elevation: 0,
                  actions: [
                    // IconButton(onPressed: () {}, icon: Icon(Icons.person)),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.notifications)),
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
                // floatingActionButtonAnimator: ,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/messages');
                  },
                  // backgroundColor: colorScheme.primary,
                  // foregroundColor: colorScheme.onPrimary,
                  child: const Icon(Icons.message),
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: screenWidth * 0.0025),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Hi ${user['firstname']}",
                          style: TextStyle.lerp(textTheme.headlineMedium, textTheme.headlineSmall, 0.5)?.copyWith(fontWeight: FontWeight.w500),
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
                          child: Text(
                            'Question of the Day',
                            style: TextStyle.lerp(textTheme.headlineMedium, textTheme.headlineSmall, 0.5)?.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                        const QuestionOfTheDay(),
                        SizedBox(
                          height: screenWidth * 0.03,
                        ),
                       Text(
                          'Latest Scores',
                          style: TextStyle.lerp(textTheme.headlineMedium, textTheme.headlineSmall, 0.5)?.copyWith(fontWeight: FontWeight.w500),
                        ),
                        const ScoreGrid(),
                        SizedBox(
                          height: screenWidth * 0.03,
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: screenWidth * 0.0125),
                          child:  Text(
                            'Latest Assignments',
                            style: TextStyle.lerp(textTheme.headlineMedium, textTheme.headlineSmall, 0.5)?.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                        const AssignmentList(),
                      ],
                    ),
                  ),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                    leading: const Image(
                      image: AssetImage('assets/logo-2.png'),
                      width: 40,
                    ),
                    title: const Text('Welcome to Ajmera Classes')),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: screenWidth * 0.2,
                    ),
                    Container(
                      // width: screenWidth,
                      child: Text(
                        'Enter Code',
                        style: textTheme.headlineMedium
                            ?.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.1,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
                      height: screenWidth * 0.1,
                      width: screenWidth * 0.44,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: codeCtrl,
                        focusNode: focus,
                        onTapOutside: (event) {
                          focus.unfocus();
                        },
                        cursorColor: colorScheme.onPrimary,
                        style: TextStyle(color: colorScheme.onPrimary),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: colorScheme.onPrimary)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: colorScheme.onPrimary)),
                            hintText: 'Code',
                            hintStyle: TextStyle(color: colorScheme.onPrimary),
                            // icon: const Icon(Icons.person),
                            filled: true,
                            hoverColor: colorScheme.onPrimary,
                            focusColor: colorScheme.onPrimary,
                            // label: Text('First Name'),
                            fillColor: colorScheme.primary),
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.05,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
                      child: const Text(
                        'You must have recieved a 6 Digit Code on your WhatsApp from Ajmera Classes. Please enter the code to access resources',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.05,
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
                        height: screenWidth * 0.1,
                        child: ElevatedButton(
                            onPressed: () async {
                              String code = codeCtrl.text;
                              print(code);
                              if (code.isEmpty) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('OK'))
                                        ],
                                        title: const Text('Enter Code'),
                                      );
                                    });
                              }
                              else{
                                var data = await StudentApi.getStudentDatafromCode(code);
                                print(data);
                                StudentApi.createStudent(user['uid'], data!);
                                await FirebaseFirestore.instance.collection('Users').doc(user['uid']).update({
                                  'role' : 'Student',
                                  'firstname' : data['firstname'],
                                  'lastname' : data['lastname'],
                                  'studentname' : '${data['firstname']} ${data['lastname']}'
                                });
                                await Provider.of<CurrentUserData>(context,listen: false).updateUserData(user, {
                                     'role' : 'Student',
                                  'firstname' : data['firstname'],
                                  'lastname' : data['lastname'],
                                  'studentname' : '${data['firstname']} ${data['lastname']}'
                                });
                                print(user);
                              }
                            },
                            child: Text(
                              'Register',
                              style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7)!
                                  .copyWith(color: colorScheme.onSecondary),
                            ))),
                    SizedBox(
                      height: screenWidth * 0.05,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                      height: screenWidth * 0.1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
                          onPressed: () {
                            Auth().logout();
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/login', (route) => false);
                          },
                          child: Text(
                            'Login using different email',
                            style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7)?.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                          )),
                    ),
                  ],
                ));
  }
}
