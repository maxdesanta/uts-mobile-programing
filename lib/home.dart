import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
import 'utils/image_picker_interface.dart';
import 'package:path/path.dart' as path;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Uint8List? _imageBytes;
  String? _fileName;

  // ambil gambar di kamera
  Future<void> _pickImage(ImageSource source) async {
    Uint8List? bytes;
    String? name;

    try {
      if (source == ImageSource.camera || source == ImageSource.gallery) {
        bytes = await pickImageFromMobile(source);
        final pickedFile = await ImagePicker().pickImage(source: source);
        if (pickedFile != null) {
          bytes = await pickedFile.readAsBytes();
          name = pickedFile.path;
          print("Path: ${name}");
          print("Bytes: $bytes");
        }
      } else {
        final file = await pickImageFromWebWithName(); // ambil bytes dan nama
        bytes = file['bytes'];
        name = file['name']?.split('.').first; // ambil nama tanpa ekstensi
      }

      if (bytes != null) {
        setState(() {
          _imageBytes = bytes;
          _fileName = name;
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // ambil gambar dengan file gallery
  Future<void> _pickImageWithFilePicker() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png'],
        withData: true, // agar dapat langsung bytes-nya
      );

      if (result != null && result.files.isNotEmpty) {
        final file = result.files.first;

        setState(() {
          _imageBytes = file.bytes;
          _fileName = file.name.split('.').first;
        });
      }
    } catch (e) {
      print("Gagal memilih gambar: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Iconify(Heroicons.home_20_solid, color: Colors.white, size: 35),
            SizedBox(width: 5),
            Text(
              "SenjaNusa",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 65, left: 16.0, right: 16.0),
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to Klasifikasi',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              Text(
                'Senjata Tradisional',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF9A1703),
                ),
              ),
              Text(
                'Jawa Barat',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Masukkan gambar \n senjata tradisional untuk dianalisis',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              SizedBox(height: 30),
              Container(
                width: 230,
                height: 150,
                child:
                    _imageBytes == null
                        ? Icon(Icons.image, size: 150, color: Colors.grey[600])
                        : Image.memory(
                          _imageBytes!,
                          width: 250,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
              ),
              if (_fileName != null) ...[
                SizedBox(height: 20),
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFF9A1703),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      _fileName!.toUpperCase(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF9A1703),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (BuildContext context) {
              return Wrap(
                children: [
                  ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text('Ambil Foto'),
                    onTap: () {
                      Navigator.pop(context);
                      _pickImage(ImageSource.camera);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.image),
                    title: Text('Pilih dari Galeri'),
                    onTap: () {
                      Navigator.pop(context);
                      _pickImageWithFilePicker();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add, size: 30, color: Color(0xFFFFB787)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
