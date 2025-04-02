import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigasi ke halaman utama setelah 3 detik
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/splash-welcome');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A1002), Color(0xFF9A1703)],
            stops: [0.16,0.64],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/logo-splash.png',
            width: 250,
            height: 250,
          ), 
        ),
      ),
    );
  }
}
