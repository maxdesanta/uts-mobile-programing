import 'package:flutter/material.dart';

class WeaponDetailPage extends StatelessWidget {
  final String name;
  final List<String> imagePaths;

  const WeaponDetailPage({
    super.key,
    required this.name,
    required this.imagePaths,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF9A1703)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Detail $name',
          style: const TextStyle(
            color: Color(0xFF9A1703),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Image Slider
          SizedBox(
            height: 200,
            child: PageView.builder(
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              },
            ),
          ),

          // Konten merah dengan radius atas
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0xFF9A1703),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Tombol Judul
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    child: Text(
                      'Senjata Tradisional $name',
                      style: const TextStyle(color: Colors.white),
                    ),
                    ),

                    const SizedBox(height: 12),

                    // Tag
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text("Sunda", style: TextStyle(color: Color(0xFF9A1703))),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text("Sejak Tahun 1959", style: TextStyle(color: Color(0xFF9A1703))),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Deskripsi
                    const Text(
                      "Badog adalah senjata tradisional khas masyarakat Sunda, khususnya di daerah Jawa Barat. "
                      "Senjata ini berbentuk seperti golok, tetapi memiliki bilah yang lebih pendek dan tebal. "
                      "Badog sering digunakan oleh petani dan masyarakat pedesaan untuk keperluan sehari-hari, "
                      "seperti menebang kayu, berburu, hingga sebagai alat pertahanan diri.",
                      style: TextStyle(color: Colors.white, fontSize: 14, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),

                    const SizedBox(height: 16),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Ciri-ciri Badog:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "1. Bilah Pendek dan Tebal – Dibandingkan dengan golok biasa, badog memiliki ukuran yang lebih pendek dan lebih berat, sehingga cocok untuk pekerjaan berat.\n\n"
                        "2. Pegangan Kayu – Gagangnya biasanya terbuat dari kayu jati atau mahoni, memberikan pegangan yang kuat dan nyaman.\n\n"
                        "3. Sarung Kulit atau Kayu – Untuk keamanan, badog sering disimpan dalam sarung yang terbuat dari kayu atau kulit.",
                        style: TextStyle(color: Colors.white, fontSize: 14, height: 1.6),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
