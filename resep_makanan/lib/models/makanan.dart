class Makanan {
  final String id;
  final String nama;
  final String asal;
  final String kategori;
  final String deskripsi;
  final String bahan;
  final String cara;
  final String tutor;
  final String imageAsset;
  final List<String> imageUrls;
  bool isFavorite;

  Makanan({
    required this.id,
    required this.nama,
    required this.asal,
    required this.kategori,
    required this.deskripsi,
    required this.bahan,
    required this.cara,
    required this.tutor,
    required this.imageAsset,
    required this.imageUrls,
    this.isFavorite = false,
  });
}
