import 'package:resep_makanan/models/makanan.dart';

var makananList = [
  Makanan(
    id: "1",
    nama: 'Nasi Goreng',
    asal: 'Indonesia',
    kategori: 'Makanan',
    deskripsi:
        'Nasi goreng merupakan sajian nasi yang digoreng dalam sebuah wajan atau penggorengan yang menghasilkan cita rasa berbeda karena dicampur dengan bumbu-bumbu seperti garam, bawang putih, bawang merah, merica, rempah-rempah tertentu dan kecap manis',
    bahan: '1. 100 gr daging ayam, dipotong dadu \n'
        '2. 100 gr udang, dikupas dari kulitnya \n'
        '3. 100 gr mie kuning\n '
        '4. 100 gr tauge \n'
        '4. 3 porsi nasi putih \n'
        '5. 3 butir telur ayam, dikocok lepas \n'
        '6. 3 siung bawang merah, dicincang halus \n'
        '7. 3 siung bawang putih, dicincang halus \n'
        '8. 3 sdm kecap manis \n'
        '9. 2 sdm saus tiram\n'
        '10. 1 sdm kecap asin \n'
        '11. 1 sdm saus cabai \n'
        '12. 1/2 sdt merica bubuk \n'
        '13. 1/2 bagian kol, diiris tipis \n'
        '14. 1 buah wortel ukuran sedang, dipotong dadu \n'
        '15. garam secukupnya \n'
        '16. minyak goreng secukupnya\n',
    cara: '1. Potong-potong daging ayam berbentuk dadu\n'
        '2. Cuci udang lalu potong-potong\n'
        '3. Panaskan minyak dalam wajan, masukkan udang dan ayam\n'
        '4. Masak sebentar hingga matang. Tiriskan\n'
        '5. Panaskan sedikit minyak dalam wajan\n'
        '6. Masukkan telur, aduk hingga bergumpal dan matang\n'
        '7. Masukkan nasi, aduk-aduk hingga terurai\n'
        '8. Tambahkan udang, mie kuning dan daging ayam . Aduk rata\n'
        '9. Bumbu dengan bawang merah, putih, saus tiram, saus cabai, merica dan kecap\n'
        '10. Aduk-aduk hingga rata lalu angkat\n',
    tutor: 'https://youtu.be/8ZjtrOktGr0?feature=shared',
    imageAsset: 'images/nasigoreng.jpg',
    imageUrls: [
      'https://asset.kompas.com/crops/U6YxhTLF-vrjgM8PN3RYTHlIxfM=/84x60:882x592/1200x800/data/photo/2021/11/17/61949959e07d3.jpg',
      'https://www.masakapahariini.com/wp-content/uploads/2021/07/Nasi-Goreng-Spesial-Ayam-Kecombrang.jpg',
      'https://manualdecocina.com/wp-content/uploads/2024/04/Nasi-Goreng-receta.jpg',
      'https://dcostseafood.id/wp-content/uploads/2022/04/Nasi-Goreng-spesial.jpg',
    ],
    isFavorite: false,
  ),
  Makanan(
    id: "2",
    nama: 'Rawon',
    asal: 'Ponorogo, Jawa Timur',
    kategori: 'Makanan',
    deskripsi:
        'Rawon adalah masakan khas Indonesia yang berasal dari Ponorogo, Jawa Timur, yang berupa sup daging berkuah hitam dengan campuran bumbu khas yang menggunakan kluwek. Makanan ini telah berusia lebih dari 1.000 tahun.Rawon dari Ponorogo menyebar ke penjuru Jawa Timur dan dikenal sebagai masakan khas Jawa Timur.',
    bahan: '1. 500 gram daging sandung lamur (brisket)\n'
        '2. 6 lembar daun jeruk\n'
        '3. 3 batang serai, geprek\n'
        '4. 3 liter air\n'
        '5. 1 ruas lengkuas, geprek\n'
        'Bumbu Halus :\n'
        '1. 8 siung bawang merah\n'
        '2. 5 siung bawang putih\n'
        '3. 4 buah kluwek ukuran sedang, keruk isinya\n'
        '4. 4 butir kemiri, sangrai\n'
        '5. 2 cm kunyit\n'
        '6. 1 1/2 sdt ketumbar bubuk\n'
        '7. 1 sendok teh merica\n'
        '8. 1 cm jahe\n'
        '9. 1 batang bawang perai dipotong-potong\n'
        '10. Garam secukupnya\n'
        '11. Gula secukupnya\n'
        '12. Daun jeruk\n'
        '13. Serai\n',
    cara:
        '1. Rebus air sampai mendidih. Masukkan daging sapi, rebus sampai empuk\n'
        '2. Masukkan bahan bumbu halus dan sedikit minyak goreng, haluskan pakai blender\n'
        '3. Tumis sampai matang bumbu halus, serai, dan daun jeruk. Masukkan bumbu ke dalam air rebusan daging\n'
        '4. Tambahkan air asam jawa, garam, gula, dan kaldu sapi. Koreksi rasa. Masak sampai daging empuk dan rasa sudah pas. Angkat dan sajikan bersama bahan pelengkap\n',
    tutor: 'https://youtu.be/3ZC3U0TYOhs?feature=shared',
    imageAsset: 'images/rawon.jpg',
    imageUrls: [
      'https://asset.kompas.com/crops/RAkLCVPTiwC_qhG4W4wb1dN-uX4=/0x12:983x667/1200x800/data/photo/2023/11/17/6556dc6484a92.jpg',
      'https://lingkar.news/wp-content/uploads/2023/03/Ini-Dia-Bumbu-Rawon-Istimewa-Makanan-Tradisonal-Yang-Digemari-Turis.jpg',
      'https://static.promediateknologi.id/crop/183x78:1207x718/750x500/webp/photo/p1/828/2024/06/20/Screen-Shot-2024-06-20-at-144237-3895537447.png',
      'https://indonesiakaya.com/wp-content/uploads/2023/04/ra_Artboard_16.jpg',
    ],
    isFavorite: false,
  ),
  Makanan(
    id: "3",
    nama: 'Gado - Gado',
    asal: 'Surabaya, Jawa Timur',
    kategori: 'Makanan',
    deskripsi:
        'GADO-GADO adalah makanan tradisional asli Indonesia, dalam bahasa sunda disebut lotek. Makanan ini sendiri mirip seperti salad karena berisi beraneka sayur-sayuran rebus. Perbedaannya dengan salad adalah pada makanan ini kombinasi sayuran dan bahan-bahan rebusan lainnya disajikan dengan disiram saus kacang.',
    bahan: '1. 1 siung bawang putih\n'
        '2. 3 siung bawang merah\n'
        '3. 125 gr kacang tanah\n'
        '4. 1 buah cabai merah\n'
        '5. 50-70 gr gula aren\n'
        '6. 1/2 sdt garam\n'
        '7. 40 ml santan \n'
        '8. 1 sdm Tepung Tapioka\n'
        '9. Air Secukupnya\n'
        '10. Minyak Secukupnya\n',
    cara: '1. Blender semua bahan bumbu kacang sampai halus\n'
        '2. Rebus dengan api kecil hingga mendidih\n'
        '3. Terus masak bumbu kacang hingga matang sampai meletup-letup dan kental\n'
        '4. Angkat dan sisihkan\n'
        '5. Penyajian: Ambil piring, tata rapi semua bahan gado-gado. Siram dengan saus kacang dan taburi dengan bawang goreng dan beri kerupuk secukupnya.\n',
    tutor: 'https://youtu.be/Z10XpoJBxUE?feature=shared',
    imageAsset: 'images/gadogado.jpg',
    imageUrls: [
      'https://asset.kompas.com/crops/YE6uk7pefV-z1Npv781Lj6HbETU=/0x0:1000x667/1200x800/data/photo/2023/07/26/64c082fa9b582.jpeg',
      'https://asset.kompas.com/crops/buZORZBtCi6wAXgjlnJODvahpLk=/0x0:1000x667/1200x800/data/photo/2022/05/14/627f4186cff14.jpg',
      'https://static.wixstatic.com/media/ecef2e_79c86cb5d5ac444b8a6761e1fc245646~mv2.jpg/v1/fill/w_568,h_378,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/ecef2e_79c86cb5d5ac444b8a6761e1fc245646~mv2.jpg',
    ],
    isFavorite: false,
  ),
  Makanan(
    id: "4",
    nama: 'Soto Ayam',
    asal: 'Pekalongan, Jawa Tengah',
    kategori: 'Makanan',
    deskripsi:
        'Soto merupakan salah satu jenis makanan khas Indonesia yang sangat populer di kalangan masyarakat. Makanan ini terkenal dengan kuahnya yang kaya rempah dan bumbu, serta daging yang lembut dan gurih.',
    bahan: '1. 500 gram ayam\n'
        '2. 250 gram ceker\n'
        '3. 3 lembar daun salam\n'
        '4. 3 lembar daun jeruk\n'
        '5. 2 batang serai (geprek)\n'
        '6. 1 buah tomat (potong sedang)\n'
        '7. 2 ons daun bawang + seledri (potong 1/2 cm)\n'
        '8. 6 cm lengkuas (geprek)\n'
        '9. 2 liter air\n'
        '10. 5 sdm minyak (untuk menumis bumbu)\n'
        '11. secukupnya Garam\n'
        '12. secukupnya Gula\n'
        '13. secukupnya Penyedap rasa\n'
        'Bumbu Halus :\n'
        '1. 6 siung bawang merah\n'
        '2. 4 siung bawang putih\n'
        '3. 4 buah kemiri\n'
        '4. 1/4 sdt merica bubuk\n'
        '5. 5 cm kunyit\n'
        '6. 4 cm jahe\n',
    cara:
        '1. Rebus 1 liter air masukkan ayam dan ceker kurang lebih 10mnt, sisihkan air nya untuk kuah soto\n'
        '2. Haluskan bumbu tambahkan serai geprek daun jeruk dan lengkuas geprek\n'
        '3. Panaskan minyak, tumis bumbu sampai harum, matikan api\n'
        '4. Iris2 tomat dan juga daun bawang sledri sisihkan\n'
        '5. Siapkan panci, panaskan 1 liter air dan tambahkan air rebusan ayam tadi masukkan ceker, tuang bumbu yang sudah di tumis ke dalam panci, tambahkan daun salam, gula, garam dan penyedap rasa, tunggu hingga mendidih, masukkan daun bawang dan tomat, koreksi rasa, setelah pas, matikan api, beri bawang goreng\n'
        '6. Masukkan ayam yang di rebus tadi ke dalam air garam, goreng sampai kecoklatan, suwir(iris2), siapkan taoge jeruk nipis bawang goreng (bawang gorengnya g keliatan masih di toples) sambal kecapnya jangan lupa dan juga krupuk udang, racik sendiri ya sotonya\n'
        '7. Selamat memasak untuk keluarga tercinta\n',
    tutor: 'https://youtu.be/WBAYOg9vTAE?feature=shared',
    imageAsset: 'images/soto.jpg',
    imageUrls: [
      'https://asset.kompas.com/crops/aejVVPsdwoduxukD323R3zPqeQQ=/85x119:884x652/1200x800/data/photo/2023/09/01/64f19940639d3.jpg',
      'https://asset.kompas.com/crops/Bs4oWJdV_9BRvZn1lZQBRWwX5l0=/0x0:1000x667/1200x800/data/photo/2024/01/16/65a5db1f6671b.jpg',
      'https://asset.kompas.com/crops/yc5vBBn_kny5uxIg5QNuj7Qzx6c=/0x0:1000x667/1200x800/data/photo/2024/03/21/65fbab7732136.jpeg',
      'https://asset.kompas.com/crops/9TkjfcRInG7sZYsqzyKU8qLlKVU=/0x1:1000x668/1200x800/data/photo/2021/09/26/614fd4f197446.jpeg',
    ],
    isFavorite: false,
  ),
  Makanan(
    id: "5",
    nama: 'Rendang Daging',
    asal: 'Padang, Sumatera Barat',
    kategori: 'Makanan',
    deskripsi:
        'Rendang adalah makanan tradisional khas Indonesia, khususnya berasal dari Minangkabau, Sumatra Barat. Rendang dikenal sebagai masakan berbahan dasar daging sapi yang dimasak dengan santan kelapa dan campuran berbagai rempah-rempah',
    bahan: '1.1 kg daging sapi\n'
        '2. 800 ml santan kental\n'
        '3. 1 lembar daun kunyit\n'
        '4. 3 lembar daun salam\n'
        '5. 4 lembar daun jeruk\n'
        '6. 2 batang sereh, geprek\n'
        '7. 200 ml air\n'
        'Bumbu :'
        '1. 30 buah cabe rawit\n'
        '2. 20 buah cabe merah keriting\n'
        '3. 8 butir bawang merah\n'
        '4. 3 siung bawang putih\n'
        '5. 1 ruas kunyit\n'
        '6. 7 buah cengkeh\n'
        '7. 1 sdt jinten\n'
        '8. 5 buah kapulaga\n'
        '9. 1 ruas kayu manis\n'
        '10. 3 butir bunga lawang\n'
        '11. 2 sdm bumbu pemasak kambing\n'
        '12. Secukupnyaa Bumbu kelapa sangrai\n',
    cara: '1. Blender bumbu\n'
        '2. Tumis hingga wangi bumbu dan bumbu rempah lainnya\n'
        '3. Tambahkan bumbu pemasak aduk rata\n'
        '4. Tambahkan daging, aduk rata. Setelah berubah warna tambahkan santan. Masaka sambil diaduk-aduk\n'
        '5. Tambahkan bumbu kelapa sangrai yang sdh disangrai sampai coklat dan berminyak\n'
        '6. Tambahkan garam, gula jawa, aduk rata. Masak terus hingga santan berminyak daging empuk. Masak sambil sesekali diaduk. Hingga bumbu mengerinh dan berminyak butih waktu hingga 2 jam an dengan api kecil dan sesekali diaduk-aduk\n'
        '7. Selamat Mencoba :)\n',
    tutor: 'https://youtu.be/DMcFqtm1lfY?feature=shared',
    imageAsset: 'images/rendang.jpg',
    imageUrls: [
      'https://asset.kompas.com/crops/QsUYn6p5xK4DsivCrxa0_TXdjuk=/10x36:890x623/1200x800/data/photo/2023/03/25/641e5ef63dea4.jpg',
      'https://asset.kompas.com/crops/dE1roQdWJGPUYoY-2V4AzhPoDcc=/0x3:977x654/1200x800/data/photo/2020/06/30/5efaf91e0ec2c.jpg',
      'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/1067/2024/06/15/IMG_20240615_085656-3392577461.jpg',
      'https://img-global.cpcdn.com/recipes/4d39fe268fbe3293/680x482cq70/daging-rendang-foto-resep-utama.jpg',
    ],
    isFavorite: false,
  ),
  Makanan(
    id: "6",
    nama: 'Es Cendol',
    asal: 'Ponorogo, Jawa Timur',
    kategori: 'Minuman',
    deskripsi: 'Es cendol adalah minuman yang terbuat dari tepung beras dan sebagainya yang dibentuk dengan penyaring, kemudian dicampur dengan air gula dan santan.',
    bahan: '1. 90 tepung beras\n'
'2. 70 tepung tapioka\n'
'3. 600 ml air\n'
'4. 1 sdt garam\n'
'5. 100 ml air endapan SujiPandan (12 lbr Suji+5lbr pandan)\n'
'Note : Jika menggunakan 1 sdt pasta pandan, air mineral 700 ml\n'
'Bahan Kuah Santan :\n'
'1. 700 ml santan segar dari 1/2 btr kelapa parut\n'
'2. 2 lbr daun pandan, cuci, ikat simpul\n'
'3. 1 sdt garam\n'
'Bahan kuah kinca :\n'
'1. 250 gr gula kelapa / gula merah\n'
'2. 200 ml air mineral\n'
'3. 2 lbr daun pandan\n'
'Bahan lainnya :\n'
'1. Air matang\n'
'2. Es Batu\n',
    cara: '1. Siapkan bahan dan Jus Suji pandan dengan air, kemudian disaring.\n'
    '2. Siapkan panci, kalau ada gunakan panci anti lengket.Tuang air & endapan suji pandan, aduk rata lalu masukkan tepung beras & tepung tapioka aduk rata kembali, kemudian baru nyalakan kompor, masak dengan api sedang sambil terus diaduk, sampai meletup-letup dan adonan licin. Kemudian angkat.\n'
    '3. Tuang adonan cendol kedalam cetakan, jika tidak ada bisa masukkan kedalam plastik segitiga lalu gunting ujung plastik.Gunakan kain agar tidak panas saat mencetaknya.Siapkan wadah, lalu tuang air matang tambahkan es batu, lalu semprotkan atau pencet adonan kedalam air es tadi.\n'
    '4. Membuat kuah santan :Siapkan panci, kemudian campur jadi satu semua bahan kuah santan, masak dengan api sedang, sampai mendidih, sambil terus diaduk agar santan tidak pecah. Angkat, sisihkan.\n'
    '5. Membuat Sirup Gula Kelapa :Campur semua bahan, masak dengan api sedang, sambil diaduk sampai mendidih. Angkat\n'
    '6. Jika sudah dingin, disaring, kemudian masukan ke dalam botol. Sisihkan.\n'
    '7. Es Cendol siap Disantap',

    tutor: 'https://youtu.be/tr1YARopdfU?feature=shared',
    imageAsset: 'images/escendol.jpeg',
    imageUrls: [
      'https://asset.kompas.com/crops/t3tdD3PwNMMiPxm7WKH-_qq4MmM=/0x0:1000x667/1200x800/data/photo/2023/03/12/640d6eac51567.jpg',
      'https://asset.kompas.com/crops/5-DCREkUHd6WM1-6Fj1GcQO6ydE=/0x0:1000x667/1200x800/data/photo/2020/06/23/5ef1b36539f22.jpg',
      'https://asset-2.tstatic.net/pontianak/foto/bank/images/resep-minuman-segar-buka-puasa-es-cendol-es-manado-es-cincau-es-campur-es-buah.jpg',
    ],
    isFavorite: false,
  )
];
