import 'package:flutter/material.dart';

class Worksheets extends StatefulWidget {
  const Worksheets({Key? key}) : super(key: key);

  @override
  State<Worksheets> createState() => _WorksheetsState();
}

class _WorksheetsState extends State<Worksheets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Worksheets'),
      ),
    );
  }
}
