import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

// Export platform-specific implementation
import 'image_picker_stub.dart'
  if (dart.library.io) 'image_picker_mobile.dart'
  if (dart.library.html) 'image_picker_web.dart' as picker;

// Wrapper methods to expose functions
Future<Uint8List?> pickImageFromMobile(ImageSource source) {
  return picker.pickImageFromMobile(source);
}

Future<Uint8List?> pickImageFromWeb() {
  return picker.pickImageFromWeb();
}

Future<Map<String, dynamic>> pickImageFromWebWithName() async {
  return await pickImageFromWebWithName();
}
