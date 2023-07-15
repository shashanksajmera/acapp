import 'package:ajmeraclassesapp/api/student-api.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterStudent extends StatefulWidget {
  const RegisterStudent({super.key});

  @override
  State<RegisterStudent> createState() => _RegisterStudentState();
}

class _RegisterStudentState extends State<RegisterStudent> {
  FocusNode firstname = FocusNode();
  FocusNode lastname = FocusNode();
  FocusNode phoneNumber = FocusNode();
  FocusNode fees = FocusNode();
  String classValue = 'Class 10';
  String board = "ICSE";
  List<String> classes = [
    'Class 10',
    'Class 9',
    'Class 8',
    'Class 7',
    'Class 6',
    'Class 5'
  ];

  final FormKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController feesController = TextEditingController();
  String first = "", last = "", phone = "", fee = "";
  String code = "";
  bool codeGen = false;
  bool saved = false;
  void generateCode() {
    // code = first[0] + last[0];
    Map<String, String> boardCode = {'ICSE': 'IC', 'CBSE': 'CB', 'Comp': 'CE'};
    Map<String, String> classCode = {
      'Class 10': '10',
      'Class 9': '09',
      'Class 8': '08',
      'Class 7': '07',
      'Class 6': '06',
      'Class 5': '05'
    };
    setState(() {
      code = first[0].toUpperCase() +
          last[0].toUpperCase() +
          boardCode[board]! +
          classCode[classValue]!;
      codeGen = true;
    });
    // print(code);
  }

  void saveStudent() {
    // print('Saving data');
    Map<String, String> studentData = {
      'firstname': first,
      'lastname': last,
      'phoneNumber': phone,
      'board': board,
      'class': classValue,
      'fees': fee,
      'code': code,
    };
    StudentApi.saveStudent(studentData);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'))
            ],
            title: Text('Student Saved'),
          );
        });
    setState(() {
      saved = true;
    });
    // print(studentData);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Register New Student'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/register');
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Form(
                key: FormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Text(
                    //   'Name',
                    //   style: textTheme.titleLarge,
                    // ),
                    SizedBox(
                      height: screenWidth * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: screenWidth * 0.1,
                          width: screenWidth * 0.44,
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.bottom,
                            controller: firstnameController,
                            focusNode: firstname,
                            onTapOutside: (event) {
                              firstname.unfocus();
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
                                hintText: 'First Name',
                                hintStyle:
                                    TextStyle(color: colorScheme.onPrimary),
                                // icon: const Icon(Icons.person),
                                filled: true,
                                hoverColor: colorScheme.onPrimary,
                                focusColor: colorScheme.onPrimary,
                                // label: Text('First Name'),
                                fillColor: colorScheme.primary),
                          ),
                        ),
                        SizedBox(
                          height: screenWidth * 0.1,
                          width: screenWidth * 0.44,
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.bottom,
                            controller: lastnameController,
                            focusNode: lastname,
                            onTapOutside: (event) {
                              lastname.unfocus();
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
                                hintText: 'Last Name',
                                hintStyle:
                                    TextStyle(color: colorScheme.onPrimary),
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
                            items: classes
                                .map<DropdownMenuItem<String>>((String value) {
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
                    Text(
                      'Board',
                      style: textTheme.titleLarge,
                    ),
                    Container(
                      height: screenWidth * 0.1,
                      child: RadioListTile<String>(
                        title: Text("ICSE"),
                        value: "ICSE",
                        groupValue: board,
                        onChanged: (value) {
                          setState(() {
                            board = value!;
                          });
                        },
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                    Container(
                      height: screenWidth * 0.1,
                      child: RadioListTile<String>(
                        title: Text("CBSE"),
                        value: "CBSE",
                        groupValue: board,
                        onChanged: (value) {
                          setState(() {
                            board = value!;
                          });
                        },
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                    Container(
                      height: screenWidth * 0.1,
                      child: RadioListTile<String>(
                        title: Text("Competative Exams"),
                        value: "Comp",
                        groupValue: board,
                        onChanged: (value) {
                          setState(() {
                            board = value!;
                          });
                        },
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Phone Number',
                          style: textTheme.titleLarge,
                        ),
                        SizedBox(
                          height: screenWidth * 0.1,
                          width: screenWidth * 0.5,
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.bottom,
                            controller: phoneNumberController,
                            focusNode: phoneNumber,
                            onTapOutside: (event) {
                              phoneNumber.unfocus();
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Enter Phone Number';
                              }

                              if (value?.length != 10) {
                                return 'Mobile Number must be of 10 digit';
                              } else {
                                return null;
                              }
                            },
                            cursorColor: colorScheme.onPrimary,
                            style: TextStyle(color: colorScheme.onPrimary),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: colorScheme.onPrimary)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: colorScheme.onPrimary)),
                                hintText: 'Phone Number',
                                hintStyle:
                                    TextStyle(color: colorScheme.onPrimary),
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
                          'Fees',
                          style: textTheme.titleLarge,
                        ),
                        SizedBox(
                          height: screenWidth * 0.1,
                          width: screenWidth * 0.5,
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.bottom,
                            controller: feesController,
                            focusNode: fees,
                            onTapOutside: (event) {
                              fees.unfocus();
                            },
                            cursorColor: colorScheme.onPrimary,
                            style: TextStyle(color: colorScheme.onPrimary),
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: colorScheme.onPrimary)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: colorScheme.onPrimary)),
                                hintText: 'Fees',
                                hintStyle:
                                    TextStyle(color: colorScheme.onPrimary),
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
                  ],
                ),
              ),
              SizedBox(
                height: screenWidth * 0.03,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Code',
                    style: textTheme.titleLarge,
                  ),
                  codeGen
                      ? Text(
                          code,
                          style: textTheme.titleLarge,
                        )
                      : SizedBox(
                          width: screenWidth * 0.5,
                          // height: screenWidth*0.1,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding:
                                      EdgeInsets.all(screenWidth * 0.05 / 4)),
                              onPressed: () {
                                if (FormKey.currentState!.validate()) {
                                  setState(() {
                                    first = firstnameController.text;
                                    last = lastnameController.text;
                                  });
                                  generateCode();
                                }
                              },
                              child: Text('Generate Code',
                                  style: textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary))),
                        )
                ],
              ),
              SizedBox(
                height: screenWidth * 0.05,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
                  onPressed: () {
                    if (FormKey.currentState!.validate()) {
                      if (code.isNotEmpty) {
                        setState(() {
                          first = firstnameController.text;
                          last = lastnameController.text;
                          phone = phoneNumberController.text;
                          fee = feesController.text;
                        });
                        saveStudent();
                      } else {
                        final snackbar = SnackBar(
                          // action: SnackBarAction(label: 'Close', onPressed: () {  },

                          // ),
                          width: screenWidth * 0.38,
                          backgroundColor: Colors.black,
                          behavior: SnackBarBehavior.floating,
                          // margin: EdgeInsets.all(screenWidth*0.05),
                          // elevation: 20,
                          duration: Duration(milliseconds: 1500),
                          content: Text('Generate Code First',
                              style: textTheme.bodyMedium
                                  ?.copyWith(color: Colors.white)),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                    }
                  },
                  child: Text('Save Student',
                      style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onSecondary))),
              Visibility(
                visible: saved,
                child: ElevatedButton.icon(
                  icon: FaIcon(FontAwesomeIcons.whatsapp),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF25d366),
                        padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
                    onPressed: () {
                      launchUrl(Uri.parse('whatsapp://send?phone=91$phone&text=HelloWorld'));
                    },
                    label: Text('Share on Whatsapp',
                        style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onSecondary))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
