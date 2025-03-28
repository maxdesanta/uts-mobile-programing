import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class WeaponPage extends StatefulWidget {
  const WeaponPage({Key? key}) : super(key: key);

  @override
  State<WeaponPage> createState() => _WeaponPageState();
}

class _WeaponPageState extends State<WeaponPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Row(
          children: [
            Iconify(Mdi.sword_cross, color: Colors.white, size: 35),
            SizedBox(width: 5),
            Text(
              "Senjata",
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text('Ini adalah halaman senjata')],
        ),
      ),
    );
  }
}