import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

class PdfView extends StatefulWidget {
  const PdfView({Key? key}) : super(key: key);

  @override
  _PdfViewState createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  bool _isLoading = true;
  PDFDocument? doc;

  @override
  void initState() {
    super.initState();
    viewFile();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: _isLoading
          ? CircularProgressIndicator()
          : PDFViewer(
              document: doc!,
            ),
    ));
  }

  void viewFile() async {
    doc = await PDFDocument.fromAsset('assets/images/resume.pdf');
    // doc = await PDFDocument.fromURL(
        // 'https://drive.google.com/file/d/153XmShDSaZFSXlZDEkULU1_r1q3B3zDb/view?usp=sharing');
    setState(() => _isLoading = false);
  }
}
