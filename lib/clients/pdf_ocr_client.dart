import 'package:pdf_ocr/rust/api/extract.dart';
import 'package:pdf_ocr/rust/frb_generated.dart';

/// A client for extracting text from PDF files using OCR.
///
/// This client provides a simple interface for extracting text content from
/// PDF documents using optical character recognition (OCR) technology.
/// The underlying implementation is powered by Rust for fast and efficient processing.
///
/// Example usage:
/// ```dart
/// await PdfOcrClient.init();
/// final client = PdfOcrClient();
/// final text = await client.extractPdfText('/path/to/document.pdf');
/// ```
class PdfOcrClient {
  /// Initializes the PDF OCR library.
  ///
  /// This method must be called before using any extraction functionality.
  /// It initializes the underlying Rust library and prepares it for use.
  ///
  /// Throws an exception if initialization fails.
  static Future<void> init() async {
    await RustLib.init();
  }

  /// Extracts text from a PDF file using OCR.
  ///
  /// This method processes the PDF file at the given [path] and extracts
  /// all text content using optical character recognition. The method
  /// automatically detects the file type and uses the appropriate extraction
  /// method (PDF, DOCX, or CSV).
  ///
  /// Returns the extracted text as a [String], or `null` if extraction fails
  /// or the file type is not supported.
  ///
  /// The [path] parameter should be a valid file system path to the document.
  ///
  /// Example:
  /// ```dart
  /// final text = await client.extractPdfText('/path/to/document.pdf');
  /// if (text != null) {
  ///   print('Extracted text: $text');
  /// }
  /// ```
  Future<String?> extractPdfText(String path) async =>
      Extractor.extract(path: path);
}
