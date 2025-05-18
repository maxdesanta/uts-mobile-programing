import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Iconify(Mdi.about, color: Colors.white, size: 35),
            SizedBox(width: 5),
            Text(
              "Tentang Aplikasi",
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
      body: Container(
        padding: const EdgeInsets.only(left: 32.0, right: 32.0),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SenjaNusa",
              style: TextStyle(
                fontSize: 24,
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
                color: Color(0xFF9A1703),
              ),
            ),
            SizedBox(height: 10),
            Image.asset('assets/images/logo-splash.png', height: 150),
            SizedBox(height: 10),
            Text(
              "Aplikasi Deteksi Senjata Tradisionak Jawa Barat Berbasis Mobile adalah sebuah aplikasi yang dirancang untuk membantu masyarakat dalam mengidentifikasi senjata tradisional Jawa Barat. Aplikasi ini memanfaatkan teknologi pengenalan gambar (image recognition) untuk mendeteksi jenis senjata tradisional dari gambar yang diambil oleh pengguna",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            SizedBox(height: 25),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TeamPage()),
                  );
                },
                icon: Icon(Icons.group, color: Color(0xFF9A1703)),
                label: Text("Tentang Tim"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF1F1F1),
                  foregroundColor: Color(0xFF9A1703),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Color(0xFF9A1703)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// === Halaman Tentang Tim ===
class TeamPage extends StatelessWidget {
  const TeamPage({Key? key}) : super(key: key);

  Widget buildTeamCard(
    String image,
    String name,
    String role,
    String nim,
    String kelas,
    BuildContext context,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => TeamDetailPage(
                  image: image,
                  name: name,
                  nim: nim,
                  kelas: kelas,
                ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.white,
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(2),
          //  kustom card team dengan row
          child: Row(
            children: [
              // kartu profile di gambar dibungkus dengan container untuk mewarnai border dan kelengkungan border
              Container(
                width: 50,
                height: 58,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF9A1703), width: 1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  child: Image.asset(image, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontFamily: "Inter")),
                  Text(
                    role.toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xFF9A1703),
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

// membuat role bulat
  Widget _buildRoleCircle(
    String label,
    List<Color> gradientColors,
    List<double> stops,
  ) {
    return Column(
      children: [
        Container(
          width: 84, 
          height: 84,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // mambuat warna gradient
            gradient: LinearGradient(
              colors: gradientColors,
              stops: stops,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: "Inter",
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Iconify(
                Mdi.arrow_back,
                color: Color(0xFF9A1703),
                size: 30,
              ),
            ),
            SizedBox(width: 8),
            Text(
              "Tim SenjaNusa",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: "Inter",
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Background pakai Container dengan BoxDecoration
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg-list-tim.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // background hitam dengan opacity
          Container(color: Colors.black.withOpacity(0.85)),

          // Konten utama
          SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Yuk! Kenali Tim di Balik Aplikasi SenjaNusa",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF6A1002), Color(0xFF9A1703)],
                      stops: [0.12, 0.81],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Kami adalah tim yang berdedikasi untuk menghadirkan pengalaman terbaik. Setiap anggota memiliki peran penting dalam mengembangkan aplikasi ini. Yuk, kenal lebih dekat!",
                    style: TextStyle(color: Colors.white, fontFamily: "Inter"),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildRoleCircle(
                      "UI/UX\nDESIGNER",
                      [Color(0xFF6A1002), Color(0xFF9A1703)],
                      [0, 1],
                    ),
                    _buildRoleCircle(
                      "FRONTEND\nDEVS",
                      [Color(0xFFFFB042), Color(0xFFC87808)],
                      [0, 1],
                    ),
                    _buildRoleCircle(
                      "BACKEND\nDEVS",
                      [Color(0xFF0171C1), Color(0xFF00355B)],
                      [0, 1],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                buildTeamCard(
                  'assets/images/angell.jpg',
                  'Angel Calllista Pramadio',
                  'Team UI/UX Designer',
                  '2307411018',
                  'TI 4A',
                  context,
                ),
                buildTeamCard(
                  'assets/images/cintiya.jpg',
                  'Cintiya mae putri',
                  'Team UI/UX Designer',
                  '2307411004',
                  'TI 4A',
                  context,
                ),
                buildTeamCard(
                  'assets/images/marcellinus.png',
                  'Marcellinus Ario Xavier Saputra',
                  'Team UI/UX Designer',
                  '2307411003',
                  'TI 4A',
                  context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// === Halaman Detail Anggota Tim ===
class TeamDetailPage extends StatelessWidget {
  final String image;
  final String name;
  final String nim;
  final String kelas;

  const TeamDetailPage({
    super.key,
    required this.image,
    required this.name,
    required this.nim,
    required this.kelas,
  });

  Widget buildDetailCard(String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text("$title : ", style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(child: Text(value)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg-list-tim.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Lapisan hitam dengan opacity
          Container(color: Colors.black.withOpacity(0.4)),
          // Konten utama
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                const SizedBox(height: 250),
                // Card background berwarna merah
                Container(
                  padding: const EdgeInsets.only(top: 170, left: 20, right: 20, bottom: 100),
                  decoration: BoxDecoration(
                    color: const Color(0xFF9A1703),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildDetailCard("Nama", name),
                      buildDetailCard("NIM", nim),
                      buildDetailCard("Kelas", kelas),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Foto profil dengan overlap
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: ClipOval(
                child: Image.asset(
                  image,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // AppBar Custom
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Iconify(
                      Mdi.arrow_back,
                      color: Color(0xFF9A1703),
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Detail Anggota",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Inter",
                    ),
                  ),
                ],
              ),
              centerTitle: true,
            ),
          ),
        ],
      ),
    );
  }
}
