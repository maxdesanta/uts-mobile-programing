import 'package:flutter/material.dart';

// import screen
import 'package:uts_mobile_programming/homepage.dart';
import 'package:uts_mobile_programming/weaponpage.dart';
import 'package:uts_mobile_programming/aboutpage.dart';

// import icon
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/icons/heroicons.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS Flutter',
      theme: ThemeData(
        primaryColor: Color(0xFFECECEC), // Warna utama
        colorScheme: ColorScheme.light(
          primary: Color(0xFFECECEC), // Warna utama
          secondary: Color(0xFF9A1703), // Warna sekunder
        ),
      ),
      // default nama router
      initialRoute: '/',

      // daftar nama router
      routes: <String, WidgetBuilder>{
        '/': (context) => MainPage(),
        '/weapon': (context) => WeaponPage(),
        '/about': (context) => AboutPage(),
        /*
        '/login': (context) => KontakPage(),
        '/register': (context) => Dosenview(),
        */
      },
    );
  }
}

// inisiasi variabel untuk bottomnavigation
class MyPage {
  final String title;
  final String icon;
  final Widget page;

  MyPage(this.title, this.icon, this.page);
}

// bottom navigasi
class MainPage extends StatefulWidget {
  final PageStorageBucket _page = PageStorageBucket();

  // mengisi kontent variabel di array dari class MyPage
  final List<MyPage> halaman = [
    MyPage(
      "Beranda",
      Heroicons.home_20_solid,
      MyHomePage(key: PageStorageKey('key--home')),
    ),
    MyPage(
      "Senjata",
      Mdi.sword_cross,
      WeaponPage(key: PageStorageKey('key--weapon')),
    ),
    MyPage(
      "Tentang",
      Mdi.about,
      AboutPage(key: PageStorageKey('key--about')),
    )
  ];

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int screen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: widget.halaman[screen].page, 
        bucket: widget._page
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), 
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: screen,
          selectedItemColor: Theme.of(context).colorScheme.secondary, 
          unselectedItemColor: Color(0xFF484848), 
          selectedLabelStyle: TextStyle(fontSize: 12, fontFamily: "Inter", fontWeight: FontWeight.w400),
          unselectedLabelStyle: TextStyle(fontSize: 12, fontFamily: "Inter", fontWeight: FontWeight.w400),
          items: widget.halaman
              .map((e) => BottomNavigationBarItem(
                    icon: Iconify(e.icon, color: screen == widget.halaman.indexOf(e) ? Color(0xFF9A1703) : Color(0xFF484848)),
                    label: e.title,
                  ))
              .toList(),
          onTap: (index) {
            setState(() {
              screen = index;
            });
          },
        ),
        
      ),
    );
  }
}