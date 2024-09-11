import 'package:pdf_ocr/rust/api/extract.dart';
import 'package:pdf_ocr/rust/frb_generated.dart';

class PdfOcrClient {
  static init() async {
    await RustLib.init();
  }

  Future<String?> extractPdfText(String path) async =>
      Extractor.extract(path: path);
}
