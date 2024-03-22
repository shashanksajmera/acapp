

import 'package:ajmeraclassesapp/model/student.dart';
import 'package:ajmeraclassesapp/widgets/adminWidgets/addScore.dart';
import 'package:flutter/material.dart';

import '../../api/adminapi.dart';

class AddTestScores extends StatefulWidget {
  const AddTestScores({super.key});

  @override
  State<AddTestScores> createState() => _AddTestScoresState();
}

class _AddTestScoresState extends State<AddTestScores> {

  TextEditingController marksC = TextEditingController(text: "30");
  FocusNode focusNode = FocusNode();
  String classValue = 'Class 10';
  String board = "ICSE";
  String subject = "Maths";
  String testType = "Chapter";
  List<String> classes = ['Class 10', 'Class 9', 'Class 8', 'Class 7', 'Class 6', 'Class 5'];
  List<String> subjects = ['Maths','Physics','Chemistry','Biology','Science'];
  List<Student> students = [];
  // String Date = "Choose Date";
  DateTime? testDate;
  String marks = "25";
  String testCode ="";
  Map<int,String> month = {
    1 : 'Jan' ,
    2 : 'Feb' ,
    3 : 'March' ,
    4 : 'April' ,
    5 : 'May' ,
    6 : 'June' ,
    7 : 'July' ,
    8 : 'Aug' ,
    9 : 'Sept' ,
    10 : 'Oct' ,
    11 : 'Nov' ,
    12 : 'Dec'
  };
  String genTestCode(){

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
    String code = boardCode[board]! + classCode[classValue]! + subjectCode[subject]! + testDate!.day.toString() + testDate!.month.toString();
    // print(code);

    return code;
  }
  Future<List<Student>> fetchStudents() async {
    var getList = await AdminApi.fetchStudents(board,classValue);
    var getCodeList = await AdminApi.fetchStudentsfromCode(board, classValue);
    getList.addAll(getCodeList);
    return getList.map((doc){
      var data = doc.data() as Map<String,dynamic>;
      // print(data);
      return Student(
        name: data['name'] ?? data['firstname'] + data['lastname'],
        grade: data['class']!,
        board: data['board']!,
        uid: doc.id
      );
    }).toList();
  }
  void showAlert(String message){
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
            title: Text(message),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Test Scores'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Class',
                    style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7),
                  ),
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.025),
                    width: screenWidth * 0.27,
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
                      style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7),
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
                  SizedBox(
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
                    style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // color: colorScheme.primary,
                    child: Text(
                      'Test Type',
                      style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7),
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
                          value: "Chapter",
                          groupValue: testType,
                          onChanged: (value) {
                            setState(() {
                             testType = value!;
                            });
                          },
                          // contentPadding: EdgeInsets.zero,
                        ),
                        Text(
                          "Chapter",
                          style: textTheme.titleMedium,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.1,
                    child: Row(
                      children: [
                        Radio<String>(
                          // title: Text("CBSE"),
                          value: "Term",
                          groupValue: testType,
                          onChanged: (value) {
                            setState(() {
                              testType = value!;
                            });
                          },
                          // contentPadding: EdgeInsets.zero,
                        ),
                        Text(
                          "Term",
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
                  Text('Date of Test',
                    style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7),),
                  SizedBox(
                    width: screenWidth*0.45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(testDate == null? 'Choose Date' : '${testDate!.day} ${month[testDate!.month]} ${testDate!.year}',style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7),),
                        SizedBox(
                          width: screenWidth*0.02,
                        ),
                        SizedBox(
                          height: screenWidth*0.1,
                          child: ElevatedButton(
                            onPressed: () async {
                              var date = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2023), lastDate: DateTime(2025));
                              setState(() {
                                testDate = date!;
                              });
                              print(testDate);
                          },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenWidth*0.02
                              ),
                              foregroundColor: colorScheme.onSecondary,
                              backgroundColor: colorScheme.secondary
                            ),
                            child: const Icon(Icons.calendar_month),)),
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
                  Text('Maximum Marks',
                    style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7),),
                  SizedBox(
                    height: screenWidth * 0.1,
                    width: screenWidth * 0.2,
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.bottom,
                      controller: marksC,
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
                          hintText: 'Marks',
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
              SizedBox(
                height: screenWidth*0.1,
                child: ElevatedButton(onPressed: () async {
                    testCode = genTestCode();
                    Map<String,dynamic> testData = {
                      'Class' : classValue,
                      'Board' : board,
                      'Subject' : subject,
                      'Test Type' : testType,
                      'Date' : '${testDate!.day} ${month[testDate!.month]} ${testDate!.year}',
                      'Max Marks' : marksC.text,
                      'visible' : false
                    };
                    AdminApi.createTest(testData, testCode);
                    showAlert('Test Generated with test code $testCode');
                }, child: Text('Create Test',style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7)!.copyWith(
                  color: colorScheme.onSecondary,
                  // fontWeight: FontWeight.w700
                ),)),
              ),
              SizedBox(
                height: screenWidth * 0.03,
              ),
              SizedBox(
                height: screenWidth*0.1,
                child: ElevatedButton(onPressed: () async {
                    // print(testCode);
                  students = await fetchStudents();
                  setState(() {
                    students;
                  });
                }, child: Text('Fetch Students',style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7)!.copyWith(
                  color: colorScheme.onSecondary,
                  // fontWeight: FontWeight.w700
                ),)),
              ),
              SizedBox(
                height: screenWidth * 0.03,
              ),
              ...students.map((student){
                // print(student);
                return AddScore(
                  name: student.name,
                  uid: student.uid,
                  code: testCode,
                );
      }),
              SizedBox(
                height: screenWidth * 0.04,
              ),
              Visibility(
                visible: students.isNotEmpty,
                child: SizedBox(
                  height: screenWidth*0.1,
                  child: ElevatedButton(onPressed: () async {
                      AdminApi.saveScores(testCode);
                      showAlert("Scores saved for Test $testCode");
                  }, child: Text('Save Scores',style: TextStyle.lerp(textTheme.titleLarge, textTheme.titleMedium, 0.7)!.copyWith(
                    color: colorScheme.onSecondary,
                    // fontWeight: FontWeight.w700
                  ),)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



