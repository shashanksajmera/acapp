class Score{
  String subject;
  String topicName;
  int obtainedMarks;
  int totalMarks;
  DateTime? date;

  Score({this.date,required this.obtainedMarks,required this.subject,required this.topicName,required this.totalMarks});
}