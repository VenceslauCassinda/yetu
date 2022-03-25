import 'package:sqlite3/open.dart';
import 'dart:ffi';
import 'dart:io';

class TestConfig {
  static prepareInitDataBase() {
    open.overrideFor(OperatingSystem.windows, () {
      final libraryNextToScript =
          File("C:\\libs\\sqlite3.dll");
      return DynamicLibrary.open(libraryNextToScript.path);
    });
  }
}
