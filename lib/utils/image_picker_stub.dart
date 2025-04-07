import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

Future<Uint8List?> pickImageFromMobile(ImageSource source) async {
  throw UnsupportedError('Mobile picker not supported on this platform.');
}

Future<Uint8List?> pickImageFromWeb() async {
  throw UnsupportedError('Web picker not supported on this platform.');
}
