# pdf_ocr

A Flutter/Dart plugin for extracting text from PDF files using native Rust-powered OCR for fast and accurate results. Ideal for applications that need to process and analyze PDF documents on mobile and desktop platforms.

## Features

- Extracts text from PDF files using OCR (Optical Character Recognition)
- Fast and efficient, powered by Rust native code
- Simple API for integration into Flutter and Dart projects
- Cross-platform support

## Getting started

### Prerequisites

- Rust toolchain (for building native code)
- Platform-specific build tools (see [flutter_rust_bridge](https://github.com/fzyzcjy/flutter_rust_bridge))

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  pdf_ocr: ^<latest_version>
```

## Usage

Check out the example project.

```dart
FilePickerResult? result = await FilePicker.platform.pickFiles();

final content = await PdfOcrClient().extractPdfText(
    result.files.single.path!,
);
```
