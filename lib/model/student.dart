class Student{
  String name='';
  String grade= "";
  String board = "";
  String uid = "";

  Student({required this.board,required this.grade,required this.uid,required this.name});
}
class StudentCode{
  String firstname = "";
  String lastname = "";
  String board = "";
  String grade = "";
  String code = "";
  String fees;
  String phone = "";
  StudentCode({required this.board,required this.grade,required this.code,required this.lastname,required this.firstname,required this.fees,required this.phone});
}