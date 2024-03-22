import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';

class LatestNotification extends StatefulWidget {
  const LatestNotification({super.key});

  @override
  State<LatestNotification> createState() => _LatestNotificationState();
}

class _LatestNotificationState extends State<LatestNotification> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CurrentUserData>(context).currentUser;
    double screenWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme =Theme.of(context).textTheme;
    return Visibility(
      visible: isVisible,
      child: Container(
        margin: EdgeInsets.only(top: screenWidth*0.0375),
        padding: EdgeInsets.only(left:screenWidth*0.02),
        width: screenWidth*0.9,
        height: screenWidth*0.08,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.all(
            Radius.circular(screenWidth*0.05/4)
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('You have scored 13/25 in Mathematics Test ',style: textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary,),),
            IconButton(padding:EdgeInsets.zero,onPressed: (){
              setState(() {
                isVisible = !isVisible;
              });
            }, icon: Icon(Icons.close,color: Theme.of(context).colorScheme.onPrimary,),iconSize: 16,splashRadius: 16,)
          ],
        ),
      ),
    );
  }
}
