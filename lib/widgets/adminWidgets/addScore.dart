import 'package:ajmeraclassesapp/api/adminapi.dart';
import 'package:flutter/material.dart';

class AddScore extends StatefulWidget {
  final String name,uid,code;

  const AddScore({super.key,required this.name,required this.uid,required this.code});

  @override
  State<AddScore> createState() => _AddScoreState();
}

class _AddScoreState extends State<AddScore> {
  TextEditingController scoreController = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool saved = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth*0.02),
      margin: EdgeInsets.only(bottom:screenWidth*0.02),
      width: screenWidth*0.8,
      height: screenWidth*0.12,
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.all(Radius.circular(screenWidth*0.02))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.name,style: textTheme.titleLarge!.copyWith(
            color: colorScheme.onPrimary
          ),),
          SizedBox(
            width: screenWidth*0.33,
            child: Row(
              children: [
                SizedBox(
                  height: screenWidth * 0.1,
                  width: screenWidth * 0.2,
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.bottom,
                    controller: scoreController,
                    focusNode: focusNode,
                    onTapOutside: (event) {
                      focusNode.unfocus();
                    },
                    validator: (value) =>
                    (value!.isEmpty) ? 'Enter Name' : null,
                    cursorColor: colorScheme.onSecondary,
                    style: TextStyle(color: colorScheme.onSecondary),
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: colorScheme.primary)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: colorScheme.primary)),
                        hintText: 'Marks',
                        hintStyle: TextStyle(color: colorScheme.onSecondary),
                        // icon: const Icon(Icons.person),
                        filled: true,
                        hoverColor: colorScheme.onSecondary,
                        focusColor: colorScheme.onSecondary,
                        // label: Text('First Name'),
                        fillColor: colorScheme.secondary),
                  ),
                ),
                SizedBox(
                  height: screenWidth*0.08,
                    // width: screenWidth*0.1,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: saved ? colorScheme.onTertiary : colorScheme.onError,
                            backgroundColor: saved ? colorScheme.tertiary : colorScheme.error,
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth*0.02
                            ),
                        ),onPressed: (){
                          AdminApi.addTestScores(widget.code, widget.uid, scoreController.text);
                          setState(() {
                            saved = true;
                          });
                    }, child: const Icon(Icons.check)))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
