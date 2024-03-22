import 'package:ajmeraclassesapp/api/adminapi.dart';
import 'package:ajmeraclassesapp/model/student.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AllStudents extends StatefulWidget {
  const AllStudents({super.key});

  @override
  State<AllStudents> createState() => _AllStudentsState();
}

class _AllStudentsState extends State<AllStudents> {
  late String grade;
  late String board;
  List<Student> students = [];
  List<StudentCode> studentsCode = [];
  // M/ap arguments= {};
  void getStudents() async {
    // var doc =  await AdminApi.fetchStudents(board, grade);
    var getList = await AdminApi.fetchStudents(board,grade);
    var codeLists = await AdminApi.fetchStudentsfromCode(board, grade);
    var studentsList = getList.map((doc){
      var data = doc.data() as Map<String,dynamic>;
      print(data);
      return Student(
          name: data['firstname']! + " " + data['lastname'],
          grade: data['class']!,
          board: data['board']!,
          fees: data['fees'],
          phone: data['phoneNumber'],
          uid: doc.id
      );
    }).toList();
    var studentsFromCodeLists = codeLists.map((doc){
      var data = doc.data() as Map<String,dynamic>;

      return StudentCode(
          board: data['board'],
          grade: data['class'],
          code: data['code'],
          lastname: data['lastname'],
          firstname: data['firstname'],
          fees : data['fees'],
          phone : data['phoneNumber']);
    }).toList();
    setState(() {
      students = studentsList;
      studentsCode = studentsFromCodeLists;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getStudents();
    });
  }
  @override
  Widget build(BuildContext context) {
   final arguments = ModalRoute.of(context)?.settings.arguments as Map;
   grade = "Class ${arguments["class"]}";
   board = arguments["board"];
   double screenWidth = MediaQuery.of(context).size.width;
   // double height = MediaQuery.of(context).size.height;
   TextTheme textTheme = Theme.of(context).textTheme;
   ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Students Class ${arguments["class"]} ${arguments["board"]}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth*0.05),
        child: ListView.builder(
          itemCount: (students.length + studentsCode.length ),
            itemBuilder: (context,index){
            if(index<studentsCode.length) {
              return StudentTile.fromCode(studentCode: studentsCode[index],);
            }
            else{ return StudentTile(student: students[index-studentsCode.length],);}
        }),
      )
    );
  }
}
//ignore: must_be_immutable
class StudentTile extends StatefulWidget {
  Student? student;
  StudentCode? studentCode;
  StudentTile({super.key,required this.student});
  StudentTile.fromCode({super.key,required this.studentCode});
  @override
  State<StudentTile> createState() => _StudentTileState();
}

class _StudentTileState extends State<StudentTile> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: screenWidth*0.9,
      padding: EdgeInsets.all(screenWidth*0.025),
      margin: EdgeInsets.only(bottom: screenWidth*0.025),
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.all(Radius.circular(screenWidth*0.012))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.student != null ? widget.student!.name : "${widget.studentCode!.firstname} ${widget.studentCode!.lastname}",
                style: textTheme.titleLarge!.copyWith(
                  color: colorScheme.onPrimary
                ),
              ),

              SizedBox(
                  // width: screenWidth*0.15,
                  height: screenWidth*0.1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth*0.02
                        ),
                        elevation: 0,
                        foregroundColor: colorScheme.onPrimary,
                        backgroundColor: colorScheme.primary
                    ),
                      onPressed: (){},
                      child: const Icon(Icons.edit,size: 20,),))
            ],
          ),
          Text('Fees : ${widget.student?.fees ?? widget.studentCode!.fees}',style: textTheme.titleMedium!.copyWith(
              color: colorScheme.onPrimary
          ),),
          SizedBox(
            height: screenWidth*0.005,
          ),
          Text('No of Installments Paid : None',style: textTheme.titleMedium!.copyWith(
              color: colorScheme.onPrimary
          ),),
          Text("Batch : 1",
            style: textTheme.titleMedium!.copyWith(
                color: colorScheme.onPrimary
            ),
          ),
          if (widget.student == null) ElevatedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.whatsapp),
              style: ElevatedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onTertiary,
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
              onPressed: () {
                launchUrl(Uri.parse('whatsapp://send?phone=91${widget.studentCode?.phone}&text=HelloWorld'));
              },
              label: Text('Share on WhatsApp',
                  style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onTertiary))
          ) else
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onTertiary,
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  padding: EdgeInsets.all(screenWidth * 0.05 / 4)),
              child: Text('Sent Reminder on WhatsApp',
        style: textTheme.titleLarge?.copyWith(
    fontWeight: FontWeight.w500,
    color: Theme.of(context).colorScheme.onTertiary)))
        ],
      )
    );
  }
}


