import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';

class QuestionOfTheDay extends StatefulWidget {
  const QuestionOfTheDay({super.key});

  @override
  State<QuestionOfTheDay> createState() => _QuestionOfTheDayState();
}

class _QuestionOfTheDayState extends State<QuestionOfTheDay> {
  Widget optionBtn(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.02,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF75AEF8),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: Size.zero,
                textStyle: Theme.of(context).textTheme.titleMedium,
                padding: EdgeInsets.all(
                    MediaQuery.of(context).size.width * 0.05 / 4)),
            onPressed: () {},
            child: const Text('Option A')),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? user =
        Provider.of<CurrentUserData>(context).currentUser;
    double screenWidth = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: screenWidth*0.01,
        ),
        Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
          width: MediaQuery.of(context).size.width * 0.95,
          decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.all(Radius.circular(
                  MediaQuery.of(context).size.width * 0.05 / 4))),
          child: Text(
            'Question\nQuestion line2',
            style: textTheme.titleLarge
                ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
        optionBtn(),
        optionBtn(),
        optionBtn(),
        optionBtn(),
      ],
    );
  }
}
