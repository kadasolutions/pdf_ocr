// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.3.0.

// ignore_for_file: invalid_use_of_internal_member, unused_import, unnecessary_import

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

class Extractor {
  const Extractor();

  static Future<String?> extract({required String path}) =>
      RustLib.instance.api.crateApiExtractExtractorExtract(path: path);

  @override
  int get hashCode => 0;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Extractor && runtimeType == other.runtimeType;
}
