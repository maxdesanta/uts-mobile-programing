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
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SenjaNusa",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF9A1703),
              ),
            ),
            SizedBox(height: 10),
            Image.asset('assets/images/logo-splash.png', height: 150),
            SizedBox(height: 10),
            Text(
              "Aplikasi Deteksi Senjata Tradisional Jawa Barat Berbasis Mobile adalah sebuah aplikasi yang dirancang untuk membantu masyarakat dalam mengidentifikasi senjata tradisional Jawa Barat...",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TeamPage()),
                );
              },
              icon: Icon(Icons.group),
              label: Text("Tentang Tim"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9A1703),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      elevation: 4,
      child: ListTile(
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
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(image, height: 50, width: 50, fit: BoxFit.cover),
        ),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
          role.toUpperCase(),
          style: TextStyle(color: Color(0xFF9A1703)),
        ),
      ),
    );
  }

  Widget _buildRoleCircle(String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 30,
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 10),
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
        title: Text("Tim SenjaNusa"),
        backgroundColor: const Color(0xFF9A1703),
      ),
      body: Stack(
        children: [
          // Background pakai Container dengan BoxDecoration
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/wayang.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Lapisan hitam dengan opacity 0.4
          Container(color: Colors.black.withOpacity(0.4)),

          // Konten utama
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Yuk! Kenali Tim di Balik Aplikasi SenjaNusa",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF9A1703), Color(0xFF9A1703)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Kami adalah tim yang berdedikasi untuk menghadirkan pengalaman terbaik...",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildRoleCircle("UI/UX\nDESIGNER", Color(0xFF9A1703)),
                    _buildRoleCircle("FRONTEND\nDEVS", Colors.orange),
                    _buildRoleCircle("BACKEND\nDEVS", Colors.blue),
                  ],
                ),
                SizedBox(height: 20),
                buildTeamCard(
                  'assets/images/angell.jpg',
                  'Angel Calllista Pramadio',
                  'Team UI/UX Designer',
                  '2307411001',
                  'TI 4A',
                  context,
                ),
                buildTeamCard(
                  'assets/images/cintiya.jpg',
                  'Cintya Mae Putri',
                  'Team UI/UX Designer',
                  '2307411002',
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
                image: AssetImage('assets/images/wayang.png'),
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
                // Foto profil dengan overlap
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipOval(
                    child: Image.asset(
                      image,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Card background berwarna merah
                Container (
                  height: MediaQuery.of(context).size.height * 1, 
                  padding: const EdgeInsets.all(20),
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
          // AppBar Custom
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text("Detail Anggota"),
              centerTitle: true,
            ),
          ),
        ],
      ),
    );
  }
}
