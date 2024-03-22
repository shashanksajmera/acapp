import 'package:flutter/material.dart';

import '../../model/test.dart';

class EditTestScore extends StatefulWidget {
  final Test test;
  const EditTestScore({super.key,required this.test});

  @override
  State<EditTestScore> createState() => _EditTestScoreState();
}

class _EditTestScoreState extends State<EditTestScore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Test'),
      ),
    );
  }
}
