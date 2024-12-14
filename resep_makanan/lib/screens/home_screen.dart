import 'package:flutter/material.dart';
import 'package:resep_makanan/data/makanan_data.dart';
import 'package:resep_makanan/models/makanan.dart';
import 'package:resep_makanan/widgets/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'Makanan'; // Kategori yang dipilih

  @override
  Widget build(BuildContext context) {
    List<Makanan> filteredMakananList = makananList.where((makanan) {
      if (selectedCategory == 'Makanan') {
        return makanan.kategori == 'Makanan';
      } else if (selectedCategory == 'Minuman') {
        return makanan.kategori == 'Minuman';
      }
      return false; // Jika kategori tidak dikenali
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.restaurant_menu, size: 24),
            SizedBox(width: 8),
            Text(
              'Resep Kelompok 6',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(width: 8),
            Icon(Icons.restaurant_menu, size: 24),
          ],
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Filter kategori
          SizedBox(height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCategoryButton('Makanan', Icons.fastfood),
                const SizedBox(width: 10),
                _buildCategoryButton('Minuman', Icons.local_drink),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // GridView untuk daftar makanan
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4,
              ),
              padding: const EdgeInsets.all(8),
              itemCount: filteredMakananList.length,
              itemBuilder: (_, index) {
                Makanan makanan = filteredMakananList[index]; // Ganti dengan filteredMakananList
                return ItemCard(makanan: makanan);
              },
            ),
          ),
        ],
      ),
    );
  }
  // Widget untuk tombol kategori
  Widget _buildCategoryButton(String label, IconData icon) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor:
        selectedCategory == label ? Colors.orange : Colors.grey.shade300,
        foregroundColor:
        selectedCategory == label ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        setState(() {
          selectedCategory = label;
        });
      },
      icon: Icon(icon, size: 18),
      label: Text(label),
    );
  }
}
