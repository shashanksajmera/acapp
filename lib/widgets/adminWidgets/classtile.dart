import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/user.dart';

class ClassTile extends StatefulWidget {
  final int grade;
  final String board;
  const ClassTile({super.key, required this.grade, required this.board});

  @override
  State<ClassTile> createState() => _ClassTileState();
}

class _ClassTileState extends State<ClassTile> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? user =
        Provider.of<CurrentUserData>(context).currentUser;
    double screenWidth = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/manageClass',arguments: {
          'class' : widget.grade,
          'board' : widget.board
          // 'board' :
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: screenWidth*0.02),
        padding: EdgeInsets.all(screenWidth*0.02),
        width: screenWidth*0.9,
        height: screenWidth*0.40,
        decoration: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.all(Radius.circular(screenWidth*0.012))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Class ${widget.grade}',
                    style: textTheme.headlineSmall?.copyWith(
                    color: colorScheme.onPrimary,
                  ),),
                  Container(
                    width: screenWidth*0.5,
                    height: screenWidth*0.1,
                    padding: EdgeInsets.zero,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.onSecondary,
                            padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/manageClass',arguments: {
                            'class' : widget.grade,
                            'board' : widget.board
                            // 'board' :
                          });
                        },
                        child: Text(
                          'More Options',
                          style: textTheme.titleLarge?.copyWith(
                              color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenWidth*0.02,
            ),
            Container(
              height: screenWidth*0.1,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
                  onPressed: () {
                    // Navigator.pushNamed(context, '/manage');
                  },
                  child: Text(
                    'Edit Student Info',
                    style: textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary),
                  )),
            ),
            SizedBox(
              height: screenWidth*0.02,
            ),
            Container(
              height: screenWidth*0.1,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/manage');
                  },
                  child: Text(
                    'Edit Assignment Submissions',
                    style: textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
