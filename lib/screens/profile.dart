import 'package:ajmeraclassesapp/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<String> subjectList = ['Maths', 'Physics', '', ''];
  List<String> allSubjectList = ['Maths', 'Physics', 'Chemistry', 'Biology'];
  List<bool> installmentStatus = [true,true,false];
  @override
  Widget build(BuildContext context) {
    Map<String,dynamic>? user = Provider.of<CurrentUserData>(context).currentUser;
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.08, right: screenWidth * 0.08),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: screenWidth * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: screenWidth * 0.15,
                    backgroundColor: colorScheme.primary,
                    backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL!,
                      scale: 0.0001
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenWidth * 0.04,
              ),
              Text(
                '${user!['firstname']} ${user!['lastname']}',
                textAlign: TextAlign.center,
                style: TextStyle.lerp(
                        textTheme.headlineSmall, textTheme.headlineMedium, 0.75)
                    ?.copyWith(color: colorScheme.onBackground),
              ),
              SizedBox(
                height: screenWidth * 0.01,
              ),
              Text(
                user!['email'],
                textAlign: TextAlign.center,
                style: textTheme.titleLarge,
              ),
              SizedBox(
                height: screenWidth * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Class',
                    style: textTheme.titleLarge
                        ?.copyWith(color: colorScheme.onBackground),
                  ),
                  Text(
                    '10th',
                    style: textTheme.titleLarge
                        ?.copyWith(color: colorScheme.onBackground),
                  )
                ],
              ),
              SizedBox(
                height: screenWidth * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Board',
                    style: textTheme.titleLarge
                        ?.copyWith(color: colorScheme.onBackground),
                  ),
                  Text(
                    'ICSE',
                    style: textTheme.titleLarge
                        ?.copyWith(color: colorScheme.onBackground),
                  )
                ],
              ),
              SizedBox(
                height: screenWidth * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'School',
                    style: textTheme.titleLarge
                        ?.copyWith(color: colorScheme.onBackground),
                  ),
                  Container(
                    width: screenWidth * 0.5,
                    child: Text(
                      'Podar International School(ICSE)',
                      // softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleLarge?.copyWith(
                        color: colorScheme.onBackground,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: screenWidth * 0.03,
              ),
              Text(
                'Subjects',
                style: textTheme.titleLarge
                    ?.copyWith(color: colorScheme.onBackground),
              ),
              SizedBox(
                height: screenWidth * 0.03,
              ),
              Container(
                  padding: EdgeInsets.zero,
                  width: screenWidth * 0.84,
                  height: screenWidth * 0.06,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius:
                        BorderRadius.all(Radius.circular(screenWidth * 0.05)),
                  ),
                  child: Row(children: [
                    for (int i = 0; i < allSubjectList.length; i++)
                      Container(
                        padding: EdgeInsets.only(top: screenWidth * 0.009),
                        decoration: BoxDecoration(
                            borderRadius: (i == allSubjectList.length - 1)
                                ? BorderRadius.only(
                                    topRight: Radius.circular(screenWidth*0.03),
                                    bottomRight: Radius.circular(screenWidth*0.03)
                            )
                                : null,
                            border: Border(
                                right: (i != allSubjectList.length - 1)
                                    ? BorderSide(
                                  color: (subjectList[i] == allSubjectList[i]) ? Colors.black : Colors.white
                                )
                                    : BorderSide.none,
                            ),
                            color: (subjectList[i] == allSubjectList[i])
                                ? null
                                : colorScheme.primaryContainer),
                        width: screenWidth * 0.84 / allSubjectList.length,
                        height: screenWidth * 0.06,
                        child: Text(
                          allSubjectList[i],
                          textAlign: TextAlign.center,
                          style: textTheme.bodyLarge
                              ?.copyWith(color: (subjectList[i] == allSubjectList[i]) ? colorScheme.onPrimary : Colors.white),
                        ),
                      )
                  ])),
              SizedBox(
                height: screenWidth * 0.03,
              ),
              Text(
                'Fees Paid till date',
                style: textTheme.titleLarge
                    ?.copyWith(color: colorScheme.onBackground),
              ),
              SizedBox(
                height: screenWidth * 0.025,
              ),
              for(int i=0;i<3;i++)
                Column(
                  children: [
                    Container(
                      height: screenWidth*0.085,
                      padding: EdgeInsets.symmetric(vertical:screenWidth*0.014,
                      horizontal:screenWidth*0.025),
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        borderRadius: BorderRadius.all(
                          Radius.circular(screenWidth*0.0125)
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Installment ${i +1}',style: textTheme.titleLarge
          ?.copyWith(color: colorScheme.onPrimary)),
                          Container(
                            padding: EdgeInsets.only(top: screenWidth*0.008),
                            width: screenWidth*0.3,
                            height: screenWidth*0.057,
                            decoration: BoxDecoration(
                              color: installmentStatus[i] ? Color(0xFF005D14)
                                  : Color(0xFF93000A),
                              borderRadius: BorderRadius.all(Radius.circular(screenWidth*0.285))
                            ),
                            child: Text(installmentStatus[i] ? 'Paid'
                                : 'Not Paid',
                            textAlign: TextAlign.center,
                            style: textTheme.titleMedium,),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.025,
                    ),
                  ],
                ),
              SizedBox(
                height: screenWidth*0.17,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth*0.225),
                width: screenWidth*0.5,
                child: ElevatedButton(
                  onPressed: () {
                    Auth().logout();
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/login', (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
                  child: Text(
                    'Logout',
                    style: textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
