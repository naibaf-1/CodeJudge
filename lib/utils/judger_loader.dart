/// Copyright 2026 Fabian Roland (naibaf-1)

/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at

/// http://www.apache.org/licenses/LICENSE-2.0

/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.

import 'dart:ffi';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

// Load my library into a temporary directory (platform dependent)
Future<DynamicLibrary> loadJudgerLibrary() async {
  late final String assetPath;
  late final String fileName;

  if (Platform.isLinux) {
    assetPath = 'assets/native/linux/libjudger.so';
    fileName = 'libjudger.so';
  } else if (Platform.isWindows) {
    assetPath = 'assets/native/windows/judger.dll';
    fileName = 'judger.dll';
  } else {
    throw UnsupportedError("Unsupported platform");
  }

  // Load the asset
  final byteData = await rootBundle.load(assetPath);

  // Copy to a temporary directory because DynamicLibrary.open() needs a real file
  final tempDir = await getTemporaryDirectory();
  final libPath = '${tempDir.path}/$fileName';

  final file = File(libPath);
  await file.writeAsBytes(byteData.buffer.asUint8List());

  return DynamicLibrary.open(libPath);
}
