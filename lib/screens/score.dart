import 'package:flutter/material.dart';

class Scores extends StatefulWidget {
  const Scores({Key? key}) : super(key: key);

  @override
  State<Scores> createState() => _ScoresState();
}

class _ScoresState extends State<Scores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scores'),
      ),
    );
  }
}
