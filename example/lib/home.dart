import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pdf_ocr/clients/pdf_ocr_client.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _content = '';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('PDF OCR example'),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();

              if (result != null) {
                setState(() {
                  _content = 'Extracting text...';
                });

                final content = await PdfOcrClient()
                    .extractPdfText(result.files.single.path!);
                setState(() {
                  _content = content;
                });
              }
            },
            child: const Text('Extract text from PDF'),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: _Content(
                content: _content ?? '',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(content);
  }
}
