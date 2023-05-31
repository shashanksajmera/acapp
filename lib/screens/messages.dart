import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  final textController = TextEditingController();
  FocusNode msgFocus = FocusNode();
  List<Message> messages = [
    Message(message: 'Hi Shashank first msg',sendMessage: true,),

    Message(message: 'Hi Shashank last msg',sendMessage: false,),
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var messagesDisplay = messages.reversed.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with Teacher'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(screenWidth * 0.025,screenWidth * 0.025,screenWidth * 0.025,screenWidth * 0.15),
            child: ListView.builder(

              shrinkWrap: true,
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context,index){
                  return messagesDisplay[index];
            }),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                width: double.infinity,
                color: colorScheme.primary,
                child: Row(
                  children: [
                    Expanded(
                      child: Listener(
                        child: TextFormField(
                          // expands: true
                          focusNode: msgFocus,
                          // autofocus: true,
                          showCursor: true,
                          cursorColor: colorScheme.onPrimary,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.send,
                          minLines: 1,
                          maxLines: 40,
                          controller : textController,
                          decoration: InputDecoration(
                              hintText: "Type Here",
                              filled: true,
                              fillColor: colorScheme.primary,
                              hintStyle: TextStyle(color: colorScheme.onPrimary),
                              border: InputBorder.none
                          ),
                          onTapOutside: (event){
                            FocusManager.instance.primaryFocus?.unfocus();
                            FocusScope.of(context).requestFocus(new FocusNode());

                            msgFocus.unfocus();
                          },
                          style: TextStyle(color: colorScheme.onPrimary),
                        ),
                      ),
                    ),
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: colorScheme.primary
                      ),
                      padding: EdgeInsets.zero,
                        color: colorScheme.primary,
                        onPressed: (){
                        // print('MEssage ${textController.text}');
                        if(textController.text.isNotEmpty){
                          setState(() {
                            messages.add(Message(message: textController.text, sendMessage: true));
                          });
                          textController.clear();
                        }
                        }, icon: Icon(Icons.send,color: colorScheme.surface,))
                  ],

                ),),
          )

        ],
      ),
    );
  }
}

class Triangle extends CustomPainter {
  final Color bgColor;
  double screenWidth;

  Triangle(this.bgColor, this.screenWidth);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = bgColor;

    var path = Path();
    path.lineTo(-screenWidth * 0.0125, 0);
    path.lineTo(0, screenWidth * 0.025);
    path.lineTo(screenWidth * 0.0125, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class Message extends StatelessWidget {
  final String message ;
  final bool sendMessage;
  const Message({Key? key,required this.message,required this.sendMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: EdgeInsets.only(bottom: screenWidth*0.025),
      child: sendMessage ? Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenWidth*0.3,
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:screenWidth*0.025,vertical: screenWidth*0.018),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(screenWidth*0.025),
                    bottomRight: Radius.circular(screenWidth*0.025),
                    bottomLeft: Radius.circular(screenWidth*0.025)
                  ),
                ),
                child: Text(
                  message,
                  softWrap: true,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onPrimary
                  )
                ),
              ),
            ),
            CustomPaint(painter: Triangle(colorScheme.primary, screenWidth)),
          ]) : Row(
          // mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPaint(painter: Triangle(colorScheme.primary, screenWidth)),
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:screenWidth*0.025,vertical: screenWidth*0.018),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.only(topRight:Radius.circular(screenWidth*0.025),
                      bottomRight: Radius.circular(screenWidth*0.025),
                      bottomLeft: Radius.circular(screenWidth*0.025)
                  ),
                ),
                child: Text(
                    message,
                    style: textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onPrimary
                    )
                ),
              ),
            ),

          ]),
    );
  }
}
