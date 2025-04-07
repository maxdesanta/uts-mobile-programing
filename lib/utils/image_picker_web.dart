import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:async';

Future<Uint8List?> pickImageFromWeb() async {
  final completer = Completer<Uint8List?>();
  final input = html.FileUploadInputElement();
  input.accept = 'image/*';
  input.click();

  input.onChange.listen((event) async {
    final file = input.files?.first;
    final reader = html.FileReader();
    reader.readAsArrayBuffer(file!);
    await reader.onLoad.first;
    completer.complete(reader.result as Uint8List);
  });

  return completer.future;
}

Future<Uint8List?> pickImageFromMobile(source) async {
  throw UnsupportedError('Mobile image picker is not supported on web.');
}

Future<Map<String, dynamic>> pickImageFromWebWithName() async {
  final completer = Completer<Map<String, dynamic>>();
  final input = html.FileUploadInputElement();
  input.accept = 'image/*';
  input.click();

  input.onChange.listen((event) async {
    final file = input.files?.first;
    final reader = html.FileReader();

    reader.readAsArrayBuffer(file!);
    await reader.onLoad.first;

    completer.complete({
      'bytes': reader.result as Uint8List,
      'name': file.name,
    });
  });

  return completer.future;
}
