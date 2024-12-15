import 'package:flutter/material.dart';
import 'package:resep_makanan/data/makanan_data.dart';
import 'package:resep_makanan/models/makanan.dart';
import 'package:resep_makanan/screens/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // TODO: 1. Deklarasikan variabel yang dibutuhkan
  List<Makanan> _filteredMakanans = makananList;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2. Buat appBar dengan judul pencarian candi
      appBar: AppBar(
        title: Text('Pencarian Resep Makanan'),
        backgroundColor: Colors.deepOrange,
      ),
      // TODO: 3. Buat body berupa Column
      body: Column(
        children: [
          // TODO: 4. Buat TextField sebagai anak dari Column
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.deepPurple[50]),
              child: TextField(
                autofocus: false,
                onChanged: (query) {
                  setState(() {
                    _searchQuery = query.toLowerCase();
                    _filteredMakanans = makananList.where((makanan) {
                      return makanan.nama.toLowerCase().contains(_searchQuery);
                    }).toList();
                  });
                },

                // TODO: 6. Implementasi fitur pencarian
                decoration: InputDecoration(
                  hintText: 'Cari Makanan...',
                  prefixIcon: Icon(Icons.search),
                  // TODO: 7. Implementasi pengosongan input
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple)),
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
          ),
          // TODO: 5. Buat Listview hasil pencarian sebagai anak dari Column
          Expanded(
            child: ListView.builder(
              itemCount: _filteredMakanans.length,
              itemBuilder: (context, index) {
                final makanan = _filteredMakanans[index];
                return GestureDetector(
                    onTap: () {
                  // Navigasi ke layar detail saat item diklik
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(makanan: makanan),
                    ),
                  );
                },
                // TODO: 8. Implementasi GestureDetector dan Hero animation
                child : Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          child: Image.asset(makanan.imageAsset, fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(makanan.nama, style:TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                            Text(makanan.asal)
                          ],
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

    );
  }
}
