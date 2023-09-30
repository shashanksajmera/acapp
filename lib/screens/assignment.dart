import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
// import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Assignment extends StatefulWidget {
  const Assignment({Key? key,required this.file}) : super(key: key);
  final File file;
  @override
  State<Assignment> createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // print('$screenWidth+$height');
    TextTheme textTheme = Theme.of(context).textTheme;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    // print(widget.file.path);
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Assignment'),
      ),
      body: SfPdfViewer.file(widget.file),
    );
  }
}