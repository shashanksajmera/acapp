import 'package:flutter/material.dart';
// import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Assignment extends StatefulWidget {
  const Assignment({Key? key}) : super(key: key);

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Assignment'),
      ),
      body: SfPdfViewer.network('https://drive.google.com/uc?export=view&id=1neuFD8mokG225c0ExEooiM-cFDhBPtl1'),
    );
  }
}
// https://drive.google.com/file/d/1neuFD8mokG225c0ExEooiM-cFDhBPtl1/view?usp=sharing