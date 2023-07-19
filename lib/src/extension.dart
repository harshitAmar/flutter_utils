import 'dart:io';

import 'package:flutter/services.dart';

extension ColorExtension on List {
  toSeperatedList() {
    List<String> list = cast();

    String string = "";
    for (var element in list) {
      string = "$string$element | ";
    }

    return string;
  }

  toCommaSeperated() {
    List list = cast();

    String string = "";
    for (var element in list) {
      string = "$element,$string";
    }
    if (string.isNotEmpty) {
      return string.substring(0, string.length - 1);
    } else {
      return string;
    }
  }
}

extension FileSize on File {
  Future<double> getFileSize() async {
    int fileSizeInBytes = await length();
    double fileSizeInKB = fileSizeInBytes / 1024;
    double fileSizeInMB = fileSizeInKB / 1024;

    return fileSizeInMB;
  }
}

extension StringExtension on String {
  String get toLowerCaseWithDash {
    return toLowerCase().replaceAll(' ', '-');
  }
}

Future<File> copyAssetToFile(String assetPath, String targetPath) async {
  final byteData = await rootBundle.load(assetPath);
  final buffer = byteData.buffer;
  final file = File(targetPath);
  await file.create(recursive: true);
  await file.writeAsBytes(
      buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  return file;
}
