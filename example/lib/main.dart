import 'package:example/home.dart';
import 'package:flutter/material.dart';
import 'package:pdf_ocr/clients/pdf_ocr_client.dart';

Future<void> main() async {
  await PdfOcrClient.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Home(),
      ),
    );
  }
}
