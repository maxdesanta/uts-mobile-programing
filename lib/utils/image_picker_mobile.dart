import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

Future<Uint8List?> pickImageFromMobile(ImageSource source) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: source);
  if (pickedFile != null) {
    return await pickedFile.readAsBytes();
  }
  return null;
}

Future<Uint8List?> pickImageFromWeb() async {
  throw UnsupportedError('Web image picker is not supported on mobile.');
}
