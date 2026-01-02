import 'dart:ffi';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

// Load my library into a temporary directory
Future<DynamicLibrary> loadJudgerLibrary() async {
  final byteData = await rootBundle.load('assets/native/linux/libjudger.so');

  final tempDir = await getTemporaryDirectory();
  final libPath = '${tempDir.path}/libjudger.so';

  final file = File(libPath);
  await file.writeAsBytes(byteData.buffer.asUint8List());

  return DynamicLibrary.open(libPath);
}
