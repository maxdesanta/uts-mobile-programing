import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class WeaponDetailPage extends StatefulWidget {
  final String name;
  final List<String> imagePaths;

  const WeaponDetailPage({
    super.key,
    required this.name,
    required this.imagePaths,
  });

  @override
  State<WeaponDetailPage> createState() => _WeaponDetailPageState();
}

class _WeaponDetailPageState extends State<WeaponDetailPage> {
  final PageController controller = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Iconify(
                Mdi.arrow_back,
                color: Color(0xFF9A1703),
                size: 30,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "Detail ${widget.name}",
              style: const TextStyle(
                color: Color(0xFF9A1703),
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: "Inter",
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Image Slider
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                PageView.builder(
                  controller: controller,
                  itemCount: widget.imagePaths.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        widget.imagePaths[index],
                        height: 200,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(widget.imagePaths.length, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: currentPage == index ? 10 : 8,
                        height: currentPage == index ? 10 : 8,
                        decoration: BoxDecoration(
                          color:
                              currentPage == index
                                  ? Colors.white
                                  : Colors.white60,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),

          // Bagian konten lainnya (tetap sama)
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Senjata Tradisional ${widget.name}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "Sunda",
                            style: TextStyle(color: Color(0xFF9A1703)),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "Sejak Tahun 1959",
                            style: TextStyle(color: Color(0xFF9A1703)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Badog adalah senjata tradisional khas masyarakat Sunda, khususnya di daerah Jawa Barat. "
                      "Senjata ini berbentuk seperti golok, tetapi memiliki bilah yang lebih pendek dan tebal. "
                      "Badog sering digunakan oleh petani dan masyarakat pedesaan untuk keperluan sehari-hari, "
                      "seperti menebang kayu, berburu, hingga sebagai alat pertahanan diri.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        height: 1.5,
                      ),
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
                        "1. Bilah Pendek dan Tebal...\n\n2. Pegangan Kayu...\n\n3. Sarung Kulit atau Kayu...",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          height: 1.6,
                        ),
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
