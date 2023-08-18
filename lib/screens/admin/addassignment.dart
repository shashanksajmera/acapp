

import 'dart:io';

import 'package:ajmeraclassesapp/api/adminapi.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../assignment.dart';

class AddAssignment extends StatefulWidget {
  const AddAssignment({super.key});

  @override
  State<AddAssignment> createState() => _AddAssignmentState();
}

class _AddAssignmentState extends State<AddAssignment> {

  TextEditingController chapterCont = TextEditingController();
  String classvalue= 'Class 10';
  FocusNode focusNode = FocusNode();
  String classValue = 'Class 10';
  String board = "ICSE";
  String subject = "Maths";
  String testType = "Chapter";
  List<String> classes = ['Class 10', 'Class 9', 'Class 8', 'Class 7', 'Class 6', 'Class 5'];
  List<String> subjects = ['Maths','Physics','Chemistry','Biology','Science'];
  File filepath = File('');
  // bool preview = false;

  String genTestCode(){
    DateTime testDate = DateTime.now();
    Map<String, String> boardCode = {'ICSE': 'IC', 'CBSE': 'CB', 'Comp': 'CE'};
    Map<String, String> classCode = {
      'Class 10': '10',
      'Class 9': '09',
      'Class 8': '08',
      'Class 7': '07',
      'Class 6': '06',
      'Class 5': '05'
    };
    Map<String,String> subjectCode = {
      'Maths' : '1','Physics' : '2','Chemistry' : '3','Biology' : '4', 'Science' : '5'
    };
    String code = "Worksheet_${boardCode[board]!}${classCode[classValue]!}${subjectCode[subject]!}${testDate!.day}${testDate!.month}";
    print(code);
    return code;
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Assignment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth*0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Chapter Name',
                    style: textTheme.titleLarge,),
                  SizedBox(
                    height: screenWidth * 0.1,
                    width: screenWidth * 0.4,
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.bottom,
                      controller: chapterCont,
                      focusNode: focusNode,
                      onTapOutside: (event) {
                        focusNode.unfocus();
                      },
                      validator: (value) =>
                      (value!.isEmpty) ? 'Enter Name' : null,
                      cursorColor: colorScheme.onPrimary,
                      style: TextStyle(color: colorScheme.onPrimary),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: colorScheme.onPrimary)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: colorScheme.onPrimary)),
                          hintText: 'Chapter Name',
                          hintStyle: TextStyle(color: colorScheme.onPrimary),
                          // icon: const Icon(Icons.person),
                          filled: true,
                          hoverColor: colorScheme.onPrimary,
                          focusColor: colorScheme.onPrimary,
                          // label: Text('First Name'),
                          fillColor: colorScheme.primary),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenWidth * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Class',
                    style: textTheme.titleLarge,
                  ),
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.025),
                    width: screenWidth * 0.26,
                    height: screenWidth * 0.1,
                    decoration: BoxDecoration(
                        color: colorScheme.primary,
                        borderRadius: BorderRadius.all(
                            Radius.circular(screenWidth * 0.0125))),
                    child: DropdownButton<String>(
                      // alignment: AlignmentDirectional.bottomCenter,
                      // alignment: AlignmentDirectional.topStart,
                      dropdownColor: colorScheme.primary,
                      // hint: Text('Select Class'),
                      value: classValue,
                      iconEnabledColor: colorScheme.onPrimary,
                      // icon: Icon(
                      //   Icons.arrow_downward,
                      //   color: colorScheme.onPrimary,
                      // ),
                      // iconSize:15,
                      // elevation: 0,
                      style: textTheme.titleMedium
                          ?.copyWith(color: colorScheme.onPrimary),
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String? newValue) {
                        classValue = newValue!;
                        setState(() {
                          classValue;
                          print(classValue);
                        });
                      },
                      items:
                      classes.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenWidth * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // color: colorScheme.primary,
                    child: Text(
                      'Board',
                      style: textTheme.titleLarge,
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.1,
                    padding: EdgeInsets.zero,
                    // color: colorScheme.primary,
                    child: Row(
                      children: [
                        Radio<String>(
                          // title: Text("ICSE"),
                          value: "ICSE",
                          groupValue: board,
                          onChanged: (value) {
                            setState(() {
                              board = value!;
                            });
                          },
                          // contentPadding: EdgeInsets.zero,
                        ),
                        Text(
                          "ICSE",
                          style: textTheme.titleMedium,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.1,
                    child: Row(
                      children: [
                        Radio<String>(
                          // title: Text("CBSE"),
                          value: "CBSE",
                          groupValue: board,
                          onChanged: (value) {
                            setState(() {
                              board = value!;
                            });
                          },
                          // contentPadding: EdgeInsets.zero,
                        ),
                        Text(
                          "CBSE",
                          style: textTheme.titleMedium,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenWidth * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subject',
                    style: textTheme.titleLarge,
                  ),
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.025),
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.1,
                    decoration: BoxDecoration(
                        color: colorScheme.primary,
                        borderRadius: BorderRadius.all(
                            Radius.circular(screenWidth * 0.0125))),
                    child: DropdownButton<String>(
                      // alignment: AlignmentDirectional.bottomCenter,
                      // alignment: AlignmentDirectional.topStart,
                      dropdownColor: colorScheme.primary,
                      // hint: Text('Select Class'),
                      value: subject,
                      iconEnabledColor: colorScheme.onPrimary,
                      // icon: Icon(
                      //   Icons.arrow_downward,
                      //   color: colorScheme.onPrimary,
                      // ),
                      // iconSize:15,
                      // elevation: 0,
                      style: textTheme.titleMedium
                          ?.copyWith(color: colorScheme.onPrimary),
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String? newValue) {
                        subject = newValue!;
                        setState(() {
                          subject;
                          // print(classValue);
                        });
                      },
                      items:
                      subjects.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenWidth * 0.03,
              ),
              Container(
                height: screenWidth*0.1,
                child: ElevatedButton(onPressed: () async {
                  FilePickerResult? result = await FilePicker.platform.pickFiles();
                  if(result != null){
                    setState(() {
                      filepath = File(result.files.first.path!);
                    });
                  }
                }, child: Text('Pick Worksheet',style: textTheme.titleLarge!.copyWith(
                  color: colorScheme.onSecondary,
                  // fontWeight: FontWeight.w700
                ),)),
              ),
              SizedBox(
                height: screenWidth * 0.03,
              ),
              Container(
                height: screenWidth*0.1,
                child: ElevatedButton(onPressed: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Assignment(file: filepath,)));
                }, child: Text('Preview',style: textTheme.titleLarge!.copyWith(
                  color: colorScheme.onSecondary,
                  // fontWeight: FontWeight.w700
                ),)),
              ),
              SizedBox(
                height: screenWidth * 0.03,
              ),
              Container(
                height: screenWidth*0.1,
                child: ElevatedButton(onPressed: () async {
                    String wsCode = genTestCode();
                    Map<String,dynamic> data = {
                      'Chapter name' : chapterCont.text,
                      'class' : classvalue,
                      'board' : board,
                      'subject' : subject,
                      'code' : wsCode
                    };
                    AdminApi.saveAssignment(wsCode, data, filepath);
                }, child: Text('Save Assignment',style: textTheme.titleLarge!.copyWith(
                  color: colorScheme.onSecondary,
                  // fontWeight: FontWeight.w700
                ),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
