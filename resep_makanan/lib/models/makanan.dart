class Makanan {
  final String nama;
  final String asal;
  final String deskripsi;
  final String built;
  final String imageAsset;
  final List<String> imageUrls;
  bool isFavorite;

  Makanan({
    required this.nama,
    required this.asal,
    required this.deskripsi,
    required this.built,
    required this.imageAsset,
    required this.imageUrls,
    this.isFavorite = false,
  });
}