import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:resep_makanan/screens/comment_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:resep_makanan/models/makanan.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:resep_makanan/data/makanan_data.dart';

class DetailScreen extends StatefulWidget {
  final Makanan makanan;

  const DetailScreen({super.key, required this.makanan});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int likeCount = 0;
  bool isLiked = false;
  bool isFavorite = false;

  Future<void> _toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorite_foods') ?? [];

    if (isFavorite) {
      favorites.remove(widget.makanan.id.toString());
    } else {
      favorites.add(widget.makanan.id.toString());
    }

    await prefs.setStringList('favorite_foods', favorites);

    setState(() {
      isFavorite = !isFavorite;
    });
  }
  Future<void> _checkFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList('favorite_foods') ?? [];

    setState(() {
      isFavorite = favorites.contains(widget.makanan.id.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
  }

  void _toggleLike() {
    setState(() {
      if (isLiked) {
        likeCount--;
        isLiked = false;
      } else {
        likeCount++;
        isLiked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Makanan makanan = widget.makanan;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.deepOrangeAccent.withOpacity(0.3),
                        width: 5,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        makanan.imageAsset,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    isLiked
                        ? Icons.thumb_up_alt
                        : Icons.thumb_up_alt_outlined,
                    color: isLiked ? Colors.blue : Colors.grey,
                    size: 18.0,
                  ),
                  onPressed: _toggleLike,
                ),
                const SizedBox(width: 8.0),
                Text(
                  "$likeCount Likes",
                  style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.deepOrangeAccent.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.restaurant_menu, size: 24),
                        Text(
                          makanan.nama,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: _toggleFavorite,
                          icon: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const SizedBox(
                        width: 70,
                        child: Text(
                          'Asal',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(': ${makanan.asal}'),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.kitchen,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const SizedBox(
                        width: 70,
                        child: Text(
                          'Kategori',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(': ${makanan.kategori}'),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.description,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const SizedBox(
                        width: 70,
                        child: Text(
                          'Deskripsi',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(': ${makanan.deskripsi}'),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.shopping_basket,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const SizedBox(
                        width: 70,
                        child: Text(
                          'Bahan',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(': ${makanan.bahan}'),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.shopping_basket,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const SizedBox(
                        width: 70,
                        child: Text(
                          'Cara Masak',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(': ${makanan.cara}'),
                      ),
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
                      const Icon(
                        Icons.restaurant_menu,
                        color: Colors.blue,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const SizedBox(
                        width: 70,
                        child: Text(
                          'Tutorial',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        onTap: () async{
                          final Uri url = Uri.parse(makanan.tutor);
                          if(await canLaunchUrl(url)){
                            await launchUrl(url);
                          }else{
                            throw 'tidak dapat membuka link : $url';
                          }
                        },
                        child: Text(': ${makanan.tutor}',
                            style : const TextStyle(
                                color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Colors.deepPurple.shade100),
                  const Text(
                    'Galeri',
                    style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: makanan.imageUrls.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    Dialog(
                                      backgroundColor: Colors.transparent,
                                      child: InteractiveViewer(
                                        panEnabled: true, // Aktifkan geser
                                        minScale: 0.5, // Skala minimal zoom
                                        maxScale: 4.0,
                                        child: CachedNetworkImage(
                                          imageUrl: widget.makanan
                                              .imageUrls[index],
                                          fit: BoxFit.contain,
                                          placeholder: (context, url) =>
                                              Container(
                                                color: Colors.deepPurple[50],
                                                width: 300,
                                                height: 300,
                                              ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons
                                                  .error), // Skala maksimal zoom
                                        ),

                                      ),
                                    ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.deepPurple.shade100,
                                  width: 2,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: makanan.imageUrls[index],
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    width: 120,
                                    height: 120,
                                    color: Colors.deepPurple[50],
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 4,),
                  const Text(
                    'Tap untuk memperbesar',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton.icon(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CommentsScreen(makananId: makanan.id.toString()),
                          ),
                        );
                      },
                    icon: const Icon(Icons.comment),
                    label: const Text("Lihat Semua Komentar"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
