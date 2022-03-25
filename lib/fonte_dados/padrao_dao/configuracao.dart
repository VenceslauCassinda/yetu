import 'dart:ffi';
import 'dart:io';

DynamicLibrary openOn() {
  final script = File(Platform.script.toFilePath()).parent;
  final libraryNextToScript = File('C:\\Users\\Venceslau\\AppData\\Local\\flutter\\bin\\sqlite3.dll');
  return DynamicLibrary.open(libraryNextToScript.path);
}
