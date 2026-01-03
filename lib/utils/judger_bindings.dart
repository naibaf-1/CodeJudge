import 'dart:ffi';
import 'package:ffi/ffi.dart';

typedef c_judger_func = Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>);
typedef dart_judger_func = Pointer<Utf8> Function(Pointer<Utf8>, Pointer<Utf8>, Pointer<Utf8>);

// Define the bindings for my library
class JudgerLib {
  late final DynamicLibrary _lib;
  late final dart_judger_func runJudge;

  JudgerLib(this._lib) {
    runJudge = _lib.lookup<NativeFunction<c_judger_func>>('runJudge').asFunction();
  }

  // Function "translating" between the library and the flutter code
  String callJudger(String code, String programmingLanguage, String solution) {
    final codePointer = code.toNativeUtf8();
    final languagePointer = programmingLanguage.toNativeUtf8();
    final solutionPointer = solution.toNativeUtf8();

    final resultPointer = runJudge(codePointer, languagePointer, solutionPointer);

    final result = resultPointer.toDartString();

    // Free memory, because the library doesn't free it
    malloc.free(codePointer);
    malloc.free(languagePointer);
    malloc.free(solutionPointer);

    return result;
  }
}
