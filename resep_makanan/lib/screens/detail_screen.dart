import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:resep_makanan/models/makanan.dart';
import 'package:resep_makanan/data/makanan_data.dart';

class DetailScreen extends StatelessWidget {
  final Makanan makanan;

  const DetailScreen({super.key, required this.makanan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // DetailHeader
            Stack(
              children: [
                // image Utama
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      makanan.imageAsset,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // tombol back kustom
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100]?.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Detail Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8,),
                  // info atas (nama candi dan tombol favorite
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Menambahkan padding
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(8), // Opsional: Membuat sudut membulat
                          border: Border.all(
                            color: Colors.deepOrangeAccent.withOpacity(0.3), // Garis border dengan transparansi (samar)
                            width: 2, // Ketebalan garis border
                          ),
                          ),
                        child : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Memastikan elemen tersebar antara kiri dan kanan
                          children: [
                            Icon(Icons.restaurant_menu, size: 24),
                            Text(makanan.nama,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: (){}, icon:
                              Icon(Icons.favorite_border),
                            ),
                          ],
                        ),
                      ),
                  // info tengah (lokasi, dibangun, tipe)
                  SizedBox(height: 16,),
                  Row(children: [
                    Icon(Icons.location_on,color: Colors.red,),
                    SizedBox(width: 8,),
                    SizedBox(width: 70,
                      child: Text('Asal', style: TextStyle(
                          fontWeight: FontWeight.bold),),),
                    Text(': ${makanan.asal}',),
                  ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.kitchen,color: Colors.blue,),
                      SizedBox(width: 8,),
                      SizedBox(width: 70,
                        child: Text('Kategori', style: TextStyle(
                            fontWeight: FontWeight.bold),),),
                      Expanded(child: Text(': ${makanan.kategori}'),),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Icon(Icons.description,color: Colors.blue,),
                    SizedBox(width: 8,),
                    SizedBox(width: 70,
                      child: Text('Deskripsi', style: TextStyle(
                          fontWeight: FontWeight.bold),),),
                    Expanded(child: Text(': ${makanan.deskripsi}'),),
                  ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.shopping_basket,color: Colors.blue,),
                      SizedBox(width: 8,),
                      SizedBox(width: 70,
                        child: Text('Bahan', style: TextStyle(
                            fontWeight: FontWeight.bold),),),
                      Expanded(child: Text(': ${makanan.bahan}'
                        // Membungkus teks ke baris berikutnya
                      ),),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: Colors.deepPurple.shade100),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.restaurant_menu,color: Colors.blue,),
                      SizedBox(width: 8,),
                      SizedBox(width: 70,
                        child: Text('Cara Masak', style: TextStyle(
                            fontWeight: FontWeight.bold),),),
                      Expanded(child: Text(': ${makanan.cara}'
                        // Membungkus teks ke baris berikutnya
                      ),),
                    ],
                  ),
                  Divider(color: Colors.deepPurple.shade100),
                  Text('Galeri', style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: makanan.imageUrls.length,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.deepPurple.shade100,
                                    width: 2,
                                  )
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl:makanan.imageUrls[index],
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                  placeholder: (context,url) => Container(
                                    width: 120,
                                    height: 120,
                                    color: Colors.deepPurple[50],
                                  ),
                                  errorWidget: (context,url,error) => Icon(Icons.error),

                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text('Tap untuk memperbesar', style: TextStyle(
                    fontSize: 12,color: Colors.black54,
                  ),),
                ],
              ),

            ),
          ],
        ),
      ),
    );

  }
}