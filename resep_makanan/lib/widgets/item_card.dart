import 'package:flutter/material.dart';
import 'package:resep_makanan/models/makanan.dart';

class ItemCard extends StatelessWidget {
  final Makanan makanan;

  const ItemCard({super.key, required this.makanan});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(4),
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                makanan.imageAsset,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 8),
            child: Text(
              makanan.nama,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 8),
            child: Text(
              makanan.kategori,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16,bottom: 8),
            child: Text(
              makanan.asal,
              style: const TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
