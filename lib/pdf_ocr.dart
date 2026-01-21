/// A Flutter/Dart plugin for extracting text from PDF files using OCR.
///
/// This library provides functionality to extract text from PDF documents,
/// DOCX files, and CSV files using optical character recognition (OCR)
/// technology. The implementation is powered by native Rust code for
/// fast and accurate text extraction.
///
/// The main entry point is the [PdfOcrClient] class, which provides
/// methods for initializing the library and extracting text from documents.
///
/// Example:
/// ```dart
/// import 'package:pdf_ocr/pdf_ocr.dart';
///
/// await PdfOcrClient.init();
/// final client = PdfOcrClient();
/// final text = await client.extractPdfText('/path/to/document.pdf');
/// ```
library;

export 'clients/pdf_ocr_client.dart';
