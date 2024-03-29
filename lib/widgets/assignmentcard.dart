import 'package:flutter/material.dart';


class AssignmentCard extends StatefulWidget {
  const AssignmentCard({super.key, this.isSubmitted = false});
  final bool isSubmitted;

  @override
  State<AssignmentCard> createState() => _AssignmentCardState();
}

class _AssignmentCardState extends State<AssignmentCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: (){
        // Navigator.push(context, new MaterialPageRoute(builder: (context) => Assignment(file : 'https://drive.google.com/file/d/1neuFD8mokG225c0ExEooiM-cFDhBPtl1/view?usp=sharing')));
      },
      child: Container(
        padding: EdgeInsets.only(left: screenWidth * 0.01),
        margin: EdgeInsets.only(top: screenWidth * 0.025),
        width: screenWidth * 0.95,
        height: screenWidth * 0.08,
        decoration: BoxDecoration(
            color: colorScheme.primary,
            borderRadius:
                BorderRadius.all(Radius.circular(screenWidth * 0.05 / 4))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.assignment_outlined,
              size: 20,
              color: Color(0xff00315d),
            ),
            SizedBox(
              width: screenWidth*0.01,
            ),
            Text(
              'Electricity and Magnetism',
              style: TextStyle.lerp(textTheme.titleSmall, textTheme.titleMedium, 0.4)?.copyWith(color: colorScheme.onPrimary),
            ),
            SizedBox(
              width: screenWidth * 0.03,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.003),
              width: screenWidth * 0.25,
              height: screenWidth * 0.06,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(screenWidth * 0.03)),
                  color: widget.isSubmitted
                      ? const Color(0xFF005D14)
                      : const Color(0xFF93000A)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.isSubmitted ? 'Submitted' : 'Not Submitted',
                    textAlign: TextAlign.center,
                    style: textTheme.bodySmall?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios),
              iconSize: 16,
              splashRadius: 16,
              color: const Color(0xff00315d),
            )
          ],
        ),
      ),
    );
  }
}
