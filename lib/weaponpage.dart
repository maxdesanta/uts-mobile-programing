import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'weapondetailpage.dart';

class WeaponPage extends StatefulWidget {
  const WeaponPage({super.key});

  @override
  State<WeaponPage> createState() => _WeaponPageState();
}

class _WeaponPageState extends State<WeaponPage> {
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, String>> allWeapons = [
    {"name": "Bambu", "image": "assets/images/bambu.jpg"},
    {"name": "Keris", "image": "assets/images/keris.jpg"},
    {"name": "Gadok", "image": "assets/images/gadok.jpg"},
    // {"name": "Kujang", "image": "assets/images/kujang.png"},
    {"name": "Balincong", "image": "assets/images/balincong.jfif"},
    {"name": "Tombak", "image": "assets/images/tombak.jfif"},
    // {"name": "Kujang", "image": "assets/images/kujang.png"},
    {"name": "Balincong", "image": "assets/images/balincong.jfif"},
    {"name": "Tombak", "image": "assets/images/tombak.jfif"},
    // {"name": "Kujang", "image": "assets/images/kujang.png"},
    {"name": "Balincong", "image": "assets/images/balincong.jfif"},
    {"name": "Tombak", "image": "assets/images/tombak.jfif"},
  ];

  List<Map<String, String>> filteredWeapons = [];

  bool isSorted = false;

  @override
  void initState() {
    super.initState();
    filteredWeapons = List.from(allWeapons);
  }

  void _searchWeapon(String query) {
    final results =
        allWeapons.where((weapon) {
          return weapon['name']!.toLowerCase().contains(query.toLowerCase());
        }).toList();

    setState(() {
      filteredWeapons = results;
    });
  }

  void _showAll() {
    setState(() {
      filteredWeapons = List.from(allWeapons);
      _searchController.clear();
    });
  }

  void _sortWeapons() {
    setState(() {
      isSorted = !isSorted;
      filteredWeapons.sort(
        (a, b) =>
            isSorted
                ? a['name']!.compareTo(b['name']!)
                : b['name']!.compareTo(a['name']!),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9A1703),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Iconify(Mdi.sword_cross, color: Colors.white, size: 30),
            const SizedBox(width: 8),
            const Text(
              "Senjata",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: "Inter",
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFFAFAFA),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Jelajahi Koleksi Senjata",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Text(
              "Tradisional!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF9A1703),
              ),
            ),
            const SizedBox(height: 12),

            // Search Bar
            TextField(
              controller: _searchController,
              onChanged: _searchWeapon,
              cursorColor: Color(0xFF9A1703),
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF9A1703), width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xFF9A1703), width: 2),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Buttons
            Row(
              children: [
                ElevatedButton(
                  onPressed: _showAll,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF9A1703),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ), // ubah nilai sesuai keinginan
                    ),
                  ),
                  child: const Text("Semua"),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _sortWeapons,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF9A1703),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ), // ubah nilai sesuai keinginan
                    ),
                  ),
                  child: Text(isSorted ? "Z - A" : "Urutkan A - Z"),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Grid View
            Expanded(
              child: GridView.builder(
                itemCount: filteredWeapons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 card per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final weapon = filteredWeapons[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => WeaponDetailPage(
                                name: weapon['name']!,
                                imagePaths: [
                                  weapon['image']!,
                                ], 
                              ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 7,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),                              
                              child: Image.asset(
                                weapon['image']!,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Color(0xFF9A1703),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 12),
                              child: Text(
                                weapon['name']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
