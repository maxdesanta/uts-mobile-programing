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

  List<Map<String, dynamic>> allWeapons = [
    {
      "name": "Bambu",
      "images": [
        "assets/images/bambu.jpg",
        "assets/images/bambu2.jpg",
        "assets/images/bambu3.jpg",
      ],
    },
    {
      "name": "Keris",
      "images": [
        "assets/images/keris.jpg",
        "assets/images/keris2.jpg",
        "assets/images/keris3.jpg",
      ],
    },
    {
      "name": "Gadok",
      "images": [
        "assets/images/gadok.jpg",
        "assets/images/gadok2.jpg",
        "assets/images/gadok3.jpg",
      ],
    },
    {
      "name": "Balincong",
      "images": [
        "assets/images/balincong.jfif",
        "assets/images/balincong2.jfif",
        "assets/images/balincong3.jfif",
      ],
    },
    {
      "name": "Tombak",
      "images": [
        "assets/images/tombak.jfif",
        "assets/images/tombak2.jfif",
        "assets/images/tombak3.jfif",
      ],
    },
  ];

  List<Map<String, dynamic>> filteredWeapons = [];
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
        backgroundColor: const Color(0xFF9A1703),
        automaticallyImplyLeading: false,
        title: Row(
          children: const [
            Iconify(Mdi.sword_cross, color: Colors.white, size: 30),
            SizedBox(width: 8),
            Text(
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
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 20, left: 16.0, right: 16.0),
          margin: const EdgeInsets.only(top: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      TextSpan(text: 'Jelajahi Koleksi'),
                      TextSpan(
                        text: ' Senjata',
                        style: TextStyle(
                          color: Color(0xFF9A1703),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Inter",
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "Tradisional!",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF9A1703),
                  ),
                ),
                const SizedBox(height: 12),

                // Search Bar
                TextField(
                  controller: _searchController,
                  onChanged: _searchWeapon,
                  cursorColor: const Color(0xFF9A1703),
                  decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFF9A1703),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFF9A1703),
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFF9A1703),
                        width: 2,
                      ),
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
                        backgroundColor: const Color(0xFF9A1703),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Semua"),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: _sortWeapons,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9A1703),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.9,
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
                                    name: weapon['name'],
                                    imagePaths: List<String>.from(
                                      weapon['images'],
                                    ),
                                  ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFF9A1703)),
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
                                    weapon['images'][0],
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
                                    weapon['name'],
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
        ),
      ),
    );
  }
}
