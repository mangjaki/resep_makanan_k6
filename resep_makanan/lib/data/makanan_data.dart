import 'package:resep_makanan/models/makanan.dart';

var makananList = [
  Makanan(
      nama: 'Nasi Goreng',
      asal: 'Indonesia',
      kategori: 'Makanan Utama',
      deskripsi: 'Nasi goreng merupakan sajian nasi yang digoreng dalam sebuah wajan atau penggorengan yang menghasilkan cita rasa berbeda karena dicampur dengan bumbu-bumbu seperti garam, bawang putih, bawang merah, merica, rempah-rempah tertentu dan kecap manis',
      bahan:
      'Bahan-bahan: '
          '1. 100 gr daging ayam, dipotong dadu '
          '2. 100 gr udang, dikupas dari kulitnya '
          '3. 100 gr mie kuning '
          '4. 100 gr tauge '
          '4. 3 porsi nasi putih '
          '5. 3 butir telur ayam, dikocok lepas '
          '6. 3 siung bawang merah, dicincang halus '
          '7. 3 siung bawang putih, dicincang halus '
          '8. 3 sdm kecap manis '
          '9. 2 sdm saus tiram'
          '10. 1 sdm kecap asin '
          '11. 1 sdm saus cabai '
          '12. 1/2 sdt merica bubuk '
          '13. 1/2 bagian kol, diiris tipis '
          '14. 1 buah wortel ukuran sedang, dipotong dadu '
          '15. garam secukupnya '
          '16. minyak goreng secukupnya',
      cara:
      'Cara Membuat :'
          '1. Potong-potong daging ayam berbentuk dadu'
          '2. Cuci udang lalu potong-potong'
          '3. Panaskan minyak dalam wajan, masukkan udang dan ayam'
          '4. Masak sebentar hingga matang. Tiriskan'
          '5. Panaskan sedikit minyak dalam wajan'
          '6. Masukkan telur, aduk hingga bergumpal dan matang'
          '7. Masukkan nasi, aduk-aduk hingga terurai'
          '8. Tambahkan udang, mie kuning dan daging ayam . Aduk rata'
          '9. Bumbu dengan bawang merah, putih, saus tiram, saus cabai, merica dan kecap'
          '10. Aduk-aduk hingga rata lalu angkat',
      imageAsset: 'images/nasigoreng.jpg',
      imageUrls: [
        'https://cdn.rri.co.id/berita/Cirebon/o/1719201132146-ILUSTRASI_NASGOR/8w83zosucbx67ts.jpeg',
        'https://i.ytimg.com/vi/HWYhoO8PCNQ/maxresdefault.jpg',
        'https://cdn.idntimes.com/content-images/community/2022/07/fromandroid-4752b11d5e98386e9242ce8e2798dcd3_600x400.jpg',
        'https://cdn.idntimes.com/content-images/community/2019/06/43913432-181263936115512-8488123280550676639-n-411471de1339ff50ac65be456ec74d37.jpg',
      ],
    isFavorite: false,
  ),
  Makanan(
      nama: 'Rawon',
      asal: 'Ponorogo, Jawa Timur',
      kategori: 'Makanan Tradisional',
      deskripsi: 'Rawon adalah masakan khas Indonesia yang berasal dari Ponorogo, Jawa Timur, yang berupa sup daging berkuah hitam dengan campuran bumbu khas yang menggunakan kluwek. Makanan ini telah berusia lebih dari 1.000 tahun.Rawon dari Ponorogo menyebar ke penjuru Jawa Timur dan dikenal sebagai masakan khas Jawa Timur.',
      bahan:
      'Bahan-bahan :'
          '1. 500 gram daging sandung lamur (brisket)'
          '2. 6 lembar daun jeruk'
          '3. 3 batang serai, geprek'
          '4. 3 liter air'
          '5. 1 ruas lengkuas, geprek'
          'Bumbu Halus :'
          '1. 8 siung bawang merah'
          '2. 5 siung bawang putih'
          '3. 4 buah kluwek ukuran sedang, keruk isinya'
          '4. 4 butir kemiri, sangrai'
          '5. 2 cm kunyit'
          '6. 1 1/2 sdt ketumbar bubuk'
          '7. 1 sendok teh merica'
          '8. 1 cm jahe'
          '9. 1 batang bawang perai dipotong-potong'
          '10. Garam secukupnya'
          '11. Gula secukupnya'
          '12. Daun jeruk'
          '13. Serai',
      cara:
      'Cara Membuat :'
          '1. Rebus air sampai mendidih. Masukkan daging sapi, rebus sampai empuk'
          '2. Masukkan bahan bumbu halus dan sedikit minyak goreng, haluskan pakai blender'
          '3. Tumis sampai matang bumbu halus, serai, dan daun jeruk. Masukkan bumbu ke dalam air rebusan daging'
          '4. Tambahkan air asam jawa, garam, gula, dan kaldu sapi. Koreksi rasa. Masak sampai daging empuk dan rasa sudah pas. Angkat dan sajikan bersama bahan pelengkap',
      imageAsset: 'images/rawon.jpg',
      imageUrls: [
        'https://cdn.idntimes.com/content-images/community/2022/05/fromandroid-9e9e92b57ee8fce6444c5c6e0af25e19.jpg',
        'https://cdn.idntimes.com/content-images/community/2022/05/fromandroid-ae279a0d80b93b094e720d18409da05a_600x400.jpg',
        'https://assets-a1.kompasiana.com/items/album/2021/06/28/rawon-kompascom-60d9194b06310e417843cb92.jpg',
        'https://doyanayam.com/wp-content/uploads/2024/01/Screenshot_4.png',
      ],
    isFavorite: false,
  ),
  Makanan(
      nama: 'Gado - Gado',
      asal: 'Surabaya, Jawa Timur',
      kategori: 'Makanan Tradisional',
      deskripsi: 'GADO-GADO adalah makanan tradisional asli Indonesia, dalam bahasa sunda disebut lotek. Makanan ini sendiri mirip seperti salad karena berisi beraneka sayur-sayuran rebus. Perbedaannya dengan salad adalah pada makanan ini kombinasi sayuran dan bahan-bahan rebusan lainnya disajikan dengan disiram saus kacang.',
      bahan: 'Bahan-Bahan :'
          '1. 1 siung bawang putih'
          '2. 3 siung bawang merah'
          '3. 125 gr kacang tanah'
          '4. 1 buah cabai merah'
          '5. 50-70 gr gula aren'
          '6. 1/2 sdt garam'
          '7. 40 ml santan '
          '8. 1 sdm Tepung Tapioka'
          '9. Air Secukupnya'
          '10. Minyak Secukupnya',
      cara:
      'Cara Membuat :'
          '1. Blender semua bahan bumbu kacang sampai halus'
          '2. Rebus dengan api kecil hingga mendidih'
          '3. Terus masak bumbu kacang hingga matang sampai meletup-letup dan kental'
          '4. Angkat dan sisihkan'
          '5. Penyajian: Ambil piring, tata rapi semua bahan gado-gado. Siram dengan saus kacang dan taburi dengan bawang goreng dan beri kerupuk secukupnya.',
      imageAsset: 'images/gadogado.jpg',
      imageUrls: [
        'https://www.masakapahariini.com/wp-content/uploads/2019/01/gado-gado-MAHI.jpg',
        'https://asset.kompas.com/crops/buZORZBtCi6wAXgjlnJODvahpLk=/0x0:1000x667/1200x800/data/photo/2022/05/14/627f4186cff14.jpg',
        'https://asset-a.grid.id/crop/0x0:0x0/x/photo/2019/08/29/1093597743.jpg',
        'https://static.wixstatic.com/media/ecef2e_79c86cb5d5ac444b8a6761e1fc245646~mv2.jpg/v1/fill/w_568,h_378,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/ecef2e_79c86cb5d5ac444b8a6761e1fc245646~mv2.jpg',
      ],
    isFavorite: false,
  ),
  Makanan(
      nama: 'Soto Ayam',
      asal: 'Pekalongan ,Jawa Tengah',
      kategori: 'Makanan Tradisional',
      deskripsi: 'Soto merupakan salah satu jenis makanan khas Indonesia yang sangat populer di kalangan masyarakat. Makanan ini terkenal dengan kuahnya yang kaya rempah dan bumbu, serta daging yang lembut dan gurih.',
      bahan:
      'Bahan-Bahan :',
      cara:
      'Cara Membuat :',
      imageAsset: 'images/soto.jpg',
      imageUrls: [
        'https://asset.kompas.com/crops/aejVVPsdwoduxukD323R3zPqeQQ=/85x119:884x652/1200x800/data/photo/2023/09/01/64f19940639d3.jpg',
        'https://asset.kompas.com/crops/Bs4oWJdV_9BRvZn1lZQBRWwX5l0=/0x0:1000x667/1200x800/data/photo/2024/01/16/65a5db1f6671b.jpg',
        'https://asset.kompas.com/crops/yc5vBBn_kny5uxIg5QNuj7Qzx6c=/0x0:1000x667/1200x800/data/photo/2024/03/21/65fbab7732136.jpeg',
        'https://asset-2.tstatic.net/medan/foto/bank/images/resep-soto-ayam-lamongan-dan-cara-membuatnya.jpg',
      ],
    isFavorite: false,
  ),

];