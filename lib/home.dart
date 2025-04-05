import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'dart:io';
import 'dart:typed_data';
import 'dart:html' as html;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Uint8List? _imageBytes;
  final picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _imageBytes = bytes;
      });
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
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to Klasifikasi\nSenjata Tradisional Jawa Barat',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Masukkan gambar senjata tradisional untuk dianalisis',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              SizedBox(height: 20),
              Container(
                width: 200,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                    _imageBytes == null
                        ? Icon(Icons.image, size: 50, color: Colors.grey[600])
                        : Image.memory(_imageBytes!, fit: BoxFit.cover),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF9A1703),
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
                      _pickImage(ImageSource.gallery);
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add, size: 30, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
