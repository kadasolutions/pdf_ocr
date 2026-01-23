[![alt text](https://github.com/kadasolutions/pdf_ocr/blob/main/image.png?raw=true)](https://www.kadasolutions.ch/?utm_source=github&utm_medium=readme&utm_campaign=pdf_ocr)

# pdf_ocr

A Flutter/Dart plugin for extracting text from PDF files using native Rust-powered OCR for fast and accurate results. Ideal for applications that need to process and analyze PDF documents on mobile and desktop platforms.

## Features

- Extracts text from PDF files using OCR (Optical Character Recognition)
- Fast and efficient, powered by Rust native code
- Simple API for integration into Flutter and Dart projects
- Cross-platform support

## Usage

Check out the example project.

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  pdf_ocr: ^<latest_version>
```

```dart
FilePickerResult? result = await FilePicker.platform.pickFiles();

final content = await PdfOcrClient().extractPdfText(
    result.files.single.path!,
);
```

## Development prerequisites

To contribute to the development of this package, you will need to set up your development environment as follows:

- Rust toolchain (for building native code)
- Platform-specific build tools (see [flutter_rust_bridge](https://github.com/fzyzcjy/flutter_rust_bridge))

## Modifying the package

You need to install a matching version of flutter_rust_bridge_codegen, which is currently fixed to 2.11.1.
The flutter dependency should follow the same version:

```
flutter_rust_bridge: 2.11.1
```

```
cargo install flutter_rust_bridge_codegen --version 2.11.1
flutter_rust_bridge_codegen generate
```
