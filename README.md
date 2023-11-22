# Welcome to Glowventory Mobile :revolving_hearts:

#
# TUGAS 7
#

## Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter adalah bagaimana mereka mengelola dan merespons perubahan data serta interaksi pengguna. Berikut adalah penjelasan singkat tentang perbedaan utama keduanya:

1. **Stateless Widget**:
   - **Tanpa Keadaan**: Stateless widget adalah komponen UI yang tidak memiliki keadaan internal. Artinya, mereka tidak menyimpan atau merespons perubahan data atau kejadian dalam aplikasi.
   - **Tidak Dapat Berubah**: Ketika sebuah stateless widget digambarkan, tampilan widget tersebut akan selalu sama. Stateless widget tidak dapat mengubah tampilannya berdasarkan perubahan data atau masukan pengguna.
   - **Efisien**: Stateless widget cenderung lebih efisien dalam hal penggunaan sumber daya karena tidak perlu mengelola perubahan keadaan.

2. **Stateful Widget**:
   - **Dengan Keadaan**: Stateful widget adalah komponen UI yang dapat memiliki keadaan internal. Mereka dapat merespons perubahan data dan interaksi pengguna dengan mengubah tampilannya.
   - **Dapat Berubah**: Ketika sebuah stateful widget digambarkan, tampilannya dapat berubah seiring waktu berdasarkan perubahan keadaan internal, data yang diterima, atau masukan pengguna.
   - **Lebih Fleksibel**: Stateful widget lebih fleksibel dalam mengelola perubahan dinamis, seperti mengubah teks, warna, atau tampilan berdasarkan tindakan pengguna atau data yang berasal dari sumber eksternal.

Dalam praktiknya, pengembang Flutter sering memilih antara stateless widget dan stateful widget berdasarkan apakah komponen UI memerlukan keadaan yang dapat berubah. Jika tampilan komponen UI tetap konsisten sepanjang waktu, stateless widget biasanya digunakan. Namun, jika tampilan perlu berubah atau merespons perubahan data, maka stateful widget digunakan untuk mengelola keadaan dan perubahan tersebut.

## Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

**MyHomePage** adalah widget utama yang merupakan stateless widget. Ini digunakan untuk mengatur tampilan halaman utama aplikasi, membuat daftar item dan menampilkannya dalam bentuk ItemCard.

**Scaffold**: Widget ini menyediakan struktur dasar Material Design untuk layar. Dalam kasus Anda, Scaffold digunakan untuk membuat app bar dan body dari halaman.

**AppBar**: Sebuah widget app bar yang muncul di bagian atas aplikasi. Biasanya menampilkan judul dan bisa juga menampilkan tindakan lain seperti tombol.

**SingleChildScrollView**: Widget ini memungkinkan scrolling pada child widget jika child melebihi layar secara vertikal.

**Padding**: Widget ini digunakan untuk memberikan padding di sekeliling child widget-nya, dalam kasus ini, ke seluruh sisi dari Column.

**Column**: Widget ini memungkinkan Anda untuk menyusun sejumlah widget secara vertikal.

**GridView**: Widget yang memungkinkan Anda untuk menyusun child widget-nya dalam bentuk grid. GridView.count memungkinkan Anda untuk menentukan jumlah kolom dengan parameter crossAxisCount.

**Material**: Widget yang mengikuti prinsip desain Material. Dalam konteks ini, Material digunakan sebagai latar belakang untuk setiap ShopCard.

**InkWell**: Widget yang menanggapi ketukan dan menghasilkan efek semburan tinta saat diketuk. Dalam kasus ini, digunakan untuk mendeteksi tap pada ShopCard dan menampilkan SnackBar.

**Container**: Widget yang memungkinkan Anda untuk menyesuaikan child-nya dalam berbagai cara, seperti padding, margins, dan ukuran.

**Icon**: Widget yang menampilkan ikon dari sebuah set ikon, seperti Icons.checklist.

**Text**: Widget yang menampilkan string teks dengan berbagai style.

**SnackBar**: Sebuah pesan sementara yang muncul di bagian bawah layar untuk memberikan feedback kepada pengguna. Dalam kode ini, muncul ketika InkWell diketuk.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

### :white_check_mark: Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.

Saya memulai checklist ini dengan menjalankan command 
```
flutter create glowventory
```
Kemudian saya masuk ke direktori glowventory dengan command ```glowventory```. Kedua hal tersebut saya lakukan untuk membuat sebuah proyek flutter baru bernama ```glowventory```. Kemudian, saya akan menjalankan proyek menggunakan comman ```flutter run```

### :white_check_mark: Membuat tiga tombol sederhana dengan ikon dan teks untuk: Melihat daftar item (Lihat Item), Menambah item (Tambah Item), dan Logout (Logout).

Saya memulai checklist dengan membuat sebuah class ```Item``` yang isi atributnya nama dan icon, dan karena saya juga mengerjakan bonus, saya tambahkan satu atribut lagi yaitu color. Kemudian, saya membuat sebuah list dalam class ```MyHomePage``` yang isinya tombol-tombol yang ingin saya tunjukkan.

```
  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, Colors.blue[900]!), // Warna biru tua
    ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.blue[700]!), // Warna biru sedang
    ShopItem("Logout", Icons.logout, Colors.blue[500]!), // Warna biru muda
  ];
```

### :white_check_mark: Memunculkan Snackbar dengan tulisan: "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan, "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan, "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.

Snackbar ini akan muncul ketika salah satu tombol ditekan oleh pengguna. Untuk melakukannya, saya membuat sebuah stateless wisget baru yang nantinya akan memunculkan snackbar jika diklik oleh user.

```
  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color, // Menggunakan warna sesuai dengan item
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
  }
```

Dengan line of code di atas, ketika user menekan suatu icon atau tombol, akan muncul snackbar yang mengatakan "kamu telah menekan tombol "nama item".

#
# TUGAS 8
#

## Jelaskan perbedaan antara ```Navigator.push()``` dan ```Navigator.pushReplacement()```, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

Dalam pengembangan aplikasi dengan Flutter, Navigator adalah sebuah widget yang mengelola rute-rute atau halaman dalam aplikasi. Metode push() dan pushReplacement() adalah dua fungsi yang digunakan untuk navigasi antar halaman, tetapi mereka memiliki perbedaan dalam cara mereka bekerja.

* **Navigator.push()**
Metode Navigator.push() digunakan untuk menavigasi ke halaman baru di atas halaman saat ini. Ini menambahkan rute baru ke tumpukan navigator, yang berarti jika pengguna menekan tombol kembali, mereka akan kembali ke halaman sebelumnya

Contoh implementasinya dapat dilihat pada kode glowventory saya, yakni
```
      if (item.name == "Tambah Produk") {
        // TODO: Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ShopFormPage()));
      }
```

Pada kode di atas, ketika user menekan Tambah Produk pada aplikasi, Navigator.push akan melakukan navigasi ke ShopFormPage. Apabila saya ingin mengembalikan ke page berikutnya, saya dapat lakukan dengan command ```Navigate.pop()```

* **Navigator.pushReplacement()**

Metode Navigator.pushReplacement() digunakan untuk menavigasi ke halaman baru dengan menggantikan halaman saat ini di tumpukan navigator. Ini berguna ketika Anda tidak ingin pengguna kembali ke halaman sebelumnya.

Contoh implementasinya dapat dilihat pada kode glowventory saya, yakni
```
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ));
      },
```

Kode ini melakukan routing kembali ke myHomePage apabila halaman utama ditekan.

## Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

1. **GridView**: Widget ini digunakan untuk membuat susunan dua dimensi dari elemen-elemennya. Cocok untuk menampilkan konten dalam format grid, seperti galeri foto atau keyboard virtual.

2. **ListView**: Ini adalah widget yang memungkinkan pembuatan daftar yang dapat digulir. Sangat berguna untuk membuat daftar panjang yang dapat discroll, seperti daftar percakapan atau timeline berita.

3. **Column**: Widget ini mengatur elemen-elemennya dalam susunan vertikal. Ideal untuk tampilan yang memerlukan layout vertikal, seperti formulir atau daftar item.

4. **Row**: Mengatur elemen-elemennya secara horizontal dalam satu baris. Ini sangat berguna untuk layout yang memerlukan susunan horizontal, seperti toolbar atau status bar.

5. **Stack**: Widget ini memungkinkan elemen-elemennya ditumpuk satu di atas lain. Sangat berguna untuk membuat tampilan overlay, seperti menaruh badge di atas ikon.

6. **Container**: Sebuah widget yang menggabungkan fungsi pengecatan, penempatan, dan pengukuran yang umum. Ini adalah blok dasar untuk desain, memungkinkan penyesuaian bentuk, padding, margin, dan menambahkan latar belakang.

7. **Padding**: Memberikan ruang tambahan di sekitar elemen anaknya. Ini digunakan untuk memberikan jarak tambahan di sekitar widget tertentu.

8. **Align**: Widget ini menyelaraskan elemen anaknya berdasarkan parameter alignment yang ditetapkan. Berguna untuk menempatkan elemen pada posisi spesifik dalam wadah yang lebih besar.

## Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

1. **TextFormField untuk Nama Produk**: 
   - **Alasan Penggunaan**: Elemen ini digunakan untuk memasukkan nama produk. Ini adalah input teks standar yang memungkinkan pengguna memasukkan karakter alfanumerik. Validasi dilakukan untuk memastikan bahwa bidang ini tidak kosong, yang penting karena setiap produk harus memiliki nama untuk identifikasi.

2. **TextFormField untuk Jumlah (Amount)**:
   - **Alasan Penggunaan**: Input ini digunakan untuk memasukkan jumlah produk. Elemen ini juga merupakan input teks, tetapi nilai yang dimasukkan diubah menjadi integer. Validasi tambahan dilakukan untuk memastikan bahwa input adalah angka dan tidak kosong, yang penting untuk manajemen inventaris dan stok.

3. **TextFormField untuk Harga (Price)**:
   - **Alasan Penggunaan**: Digunakan untuk memasukkan harga produk. Seperti input jumlah, ini juga mengubah teks menjadi integer dan memvalidasi untuk memastikan bahwa harga yang dimasukkan adalah angka dan tidak kosong. Harga adalah informasi penting untuk transaksi penjualan.

4. **TextFormField untuk Deskripsi (Description)**:
   - **Alasan Penggunaan**: Input ini memungkinkan pengguna memasukkan deskripsi produk. Ini penting untuk memberikan informasi lebih lanjut tentang produk, seperti spesifikasi, manfaat, atau informasi lain yang relevan. Validasi memastikan bahwa deskripsi tidak dibiarkan kosong.

5. **TextFormField untuk Kategori (Category)**:
   - **Alasan Penggunaan**: Elemen ini digunakan untuk memasukkan kategori produk. Kategori membantu dalam mengklasifikasikan dan mengatur produk, membuatnya lebih mudah untuk dikelola dan dicari. Seperti elemen input lainnya, validasi memastikan bahwa bidang ini tidak dibiarkan kosong.

Setiap elemen input ini dipilih karena relevansinya dengan informasi yang diperlukan untuk mengelola produk dalam sistem inventaris. Mereka memastikan bahwa data yang diperlukan untuk setiap produk dikumpulkan secara sistematis dan valid, yang penting untuk pengelolaan data yang efektif dan akurat.

## Bagaimana penerapan clean architecture pada aplikasi Flutter?

Penerapan Clean Architecture pada aplikasi Flutter melibatkan pemisahan kode menjadi lapisan yang berbeda dengan tanggung jawab yang jelas, memastikan bahwa aplikasi mudah untuk diuji, dipelihara, dan diperluas. Berikut adalah cara umum untuk menerapkan Clean Architecture dalam Flutter:

1. **Pembagian Lapisan** : Clean Architecture biasanya dibagi menjadi beberapa lapisan, seperti:
  - Presentation Layer: Berisi UI dan logic yang mengendalikan apa yang ditampilkan di layar. Di Flutter, ini termasuk widgets dan screen layouts.
  - Business Logic Layer (BLL) atau Domain Layer: Berisi business rules dan logic aplikasi. Di sini, Anda mendefinisikan entitas, use cases, dan abstraksi repository.
  - Data Layer: Bertanggung jawab untuk mengakses data dari berbagai sumber seperti jaringan, database lokal, atau cache. Ini termasuk model data, data source (API, database lokal), dan repository yang mengimplementasikan abstraksi dari domain layer.

2. **Dependency Inversion** : Prinsip ini menekankan bahwa modul tingkat tinggi tidak harus bergantung pada modul tingkat rendah, tetapi keduanya harus bergantung pada abstraksi. Dalam konteks Flutter, ini berarti bahwa lapisan presentasi dan domain tidak harus secara langsung bergantung pada data layer. Sebagai gantinya, mereka berinteraksi melalui abstraksi atau interface.

3. **Use Cases** : Use cases adalah bagian penting dari domain layer. Mereka menggambarkan aksi spesifik yang dapat dilakukan pengguna dalam aplikasi. Setiap use case harus memiliki satu tanggung jawab dan bekerja dengan satu aliran aksi.

4. **Repository Pattern** : Pattern ini digunakan untuk memisahkan logika akses data dari business logic. Repository bertindak sebagai perantara antara domain layer dan data sources, menyediakan interface yang bersih untuk mengakses data.

5. **Testing** : Dengan memisahkan concerns, Clean Architecture memudahkan pengujian unit dan integrasi. Anda dapat menguji setiap lapisan secara terpisah, memastikan bahwa kode Anda solid dan bebas bug.

6. **Dependency Injection** : Dependency Injection (DI) sangat berguna dalam Clean Architecture. DI memungkinkan Anda untuk mengganti implementasi konkret dengan mock atau implementasi alternatif, yang sangat berguna untuk testing dan memastikan bahwa kode Anda tetap fleksibel dan mudah diubah.

Dalam implementasi di tugas ini, saya memisahkan kode menjadi beberapa direktori, seperti lib/screens dan lib/widgets. Dengan demikian, memudahkan pengelolaan kode, pengujian, dan pemeliharaan jangka panjang aplikasi

##  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

### :white_check_mark: Membuat halaman baru pada aplikasi: Saya membuat file ```glowv_form.dart``` pada direktori ```lib/screens.```

Elemen input yang saya buat mengikuti glowventory web saya yaitu name, amount, price, decription, dan category menggunakan TextFormField yang dibungkus padding. Kemudian saya juga menambahkan tombol save untuk menyimpat input form.

```
child: const Text(
  "Save",
  style: TextStyle(color: Colors.white),
),
```

Selain itu, setiap elemen input di formulir divalidasi agar tidak kosong dan sesuai dengan data type modulnya. Contohnya adalah validasi pada amount saya, yakni
```
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return "Jumlah tidak boleh kosong!";
    }
    if (int.tryParse(value) == null) {
      return "Jumlah harus berupa angka!";
    }
    return null;
  },
```

### :white_check_mark: Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol ```Tambah Item``` pada halaman utama.

Untuk bagian ini, saya menggunakan navigator.push untuk menavigasi ke page forms ketika card Add New Item ditekan pada ```menu.dart``` menggunakan line of code

```
  if (item.name == "Tambah Item") {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ShopFormPage()));
  }
```

### :white_check_mark: Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru. 

Ketika pengguna menekan tombol ```Save```, aplikasi akan melakukan validasi dan apabila semua data benar, aplikasi apan menampilkan dialog pop up dengan data yang sesuai dengan apa yang telah diisi pengguna dalam form tersebut. Tombol ```ok``` akan memanggil ```Navigator.pop(context)``` yang menghapus ```AlertDialog``` dari tampilan. Setelah dialog ditampilkan, ```_formKey.currentState!.reset()``` untuk membersihkan form agar formulir bersig dari data sebelumnya.

```
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Produk berhasil tersimpan'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text('Nama: $_name'),
                  Text('Amount: $_amount'),
                  Text('Price: $_harga'),
                  Text('Description: $_description'),
                  Text('Category: $_category')
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
    _formKey.currentState!.reset();
  },
```

### :white_check_mark: Membuat sebuah drawer

Pada implementasi checklist ini, saya membuat sebuah file ```left_drawer.dart``` pada ```lib/widgets```. Kemudian saya membuat 2 opsi, yakni Halaman Utama dan Tambah Item dalam ListTile yang merupakan anak dari ListView. Ketika salah satu opsi ditekan, ```Navigato.pushReplacement``` akan menavigasi ke halaman yang sesuai.

```
  ListTile(
    leading: const Icon(Icons.home_outlined),
    title: const Text('Halaman Utama'),
    // Bagian redirection ke MyHomePage
    onTap: () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ));
    },
  ),
  ListTile(
    leading: const Icon(Icons.add_shopping_cart),
    title: const Text('Tambah Item'),
    // Bagian redirection ke ShopFormPage
    onTap: () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ShopFormPage(),
          ));
    },
  ),
```

#
# TUGAS 9
#

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Ya, bisa dilakukan dengan menggunakan ```Map<String, dynamic>``` untuk menangani data JSON secara langsung. Pengambilan data JSON tanpa model memberika fleksibilitas karena developer tidak perlu mendefinisikan struktur data terlebih dahulu. Hal ini berguna untuk prototyping cepat atau ketika berinteraksi dengan API yang sering berubah. Developer juga tidak perlu menulis kode tambahan untuk serialisasi dan deserialisasi data, yang bisa menghemat waktu pengembangan. 

Akan tetapi, jika dibandingkan dengan pembuatan model, membuat model kelas untuk JSON lebih membantu dalam menjaga kode menjadi lebih terorganisir dan mudah dibaca. Selain itu, pembuatan model membuat kode lebih mudah diperbarui. Oleh karena itu, penggunaan tanpa model lebih cocok untuk skenario ketika struktur data tidak tetap.

## Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Fungsi utama dari `CookieRequest` adalah untuk menyimpan dan mengatur informasi sesi pengguna, termasuk hal-hal seperti token autentikasi dan preferensi pengguna. Ini sangat krusial untuk aplikasi yang memerlukan pemeliharaan sesi pengguna, seperti dalam fitur login pada aplikasi dekappy ini.

Alasan mengapa instance `CookieRequest` harus tersedia di seluruh komponen aplikasi adalah untuk memastikan konsistensi sesi pengguna di seluruh bagian aplikasi. Dengan cara ini, setiap bagian dari aplikasi dapat mengakses dan menggunakan informasi sesi yang sama. Sebagai contoh, ketika pengguna sudah melakukan login, cookie yang berisi token autentikasi harus bisa diakses oleh semua komponen yang membutuhkan verifikasi autentikasi. Hal ini memungkinkan pengguna untuk tidak perlu login berulang kali ketika mereka berpindah antar fitur dalam aplikasi.

## Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter

Mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada aplikasi Flutter melibatkan beberapa langkah utama. Berikut adalah uraian dari proses tersebut:

1. **Membuat Permintaan HTTP**

Pertama, aplikasi Flutter perlu mengirim permintaan HTTP ke server atau API yang menyediakan data dalam format JSON. Ini biasanya dilakukan menggunakan paket seperti http yang tersedia di Flutter. Dapat dilihat melalui contoh kode saya, yaitu

```
Future<List<Item>> fetchItem() async {
    var url = Uri.parse(
        'http://127.0.0.1:8000/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );
}
```

2. **Mendekode Respons JSON**

Setelah menerima respons dari server, data JSON perlu didekode menjadi format yang dapat dipahami oleh Dart. Ini biasanya dilakukan dengan menggunakan fungsi jsonDecode dari library dart:convert.

3. **Mengonversi JSON ke Model (Opsional)**

Jika developer menggunakan model data khusus, langkah selanjutnya adalah mengonversi data JSON yang telah didekode menjadi objek model. Ini membantu dalam memanipulasi data lebih lanjut dan membuat kode lebih terstruktur. Contohnya pada kode saya adalah

```
class Item {
    String model;
    int pk;
    Fields fields;

    Item({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

        Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

```

4. **Menampilkan Data di Flutter**

Setelah data siap dalam bentuk objek Dart (baik sebagai Map atau model khusus), Anda dapat menampilkannya di UI Flutter menggunakan widget. Ini sering melibatkan penggunaan FutureBuilder atau StreamBuilder untuk menangani data asinkron.

## Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter

Mekanisme autentikasi yang menghubungkan aplikasi Flutter dengan server Django berlangsung dalam beberapa langkah terkoordinasi. Awalnya, pengguna memasukkan informasi akun mereka, seperti nama pengguna dan kata sandi, melalui UI di Flutter. Data ini kemudian dikirim ke server Django melalui permintaan HTTP POST, dengan data yang diformat sebagai JSON. Setelah menerima data ini, Django melakukan proses autentikasi dengan memverifikasi detail akun terhadap database. Jika detail tersebut valid, Django mengeluarkan token yang dikirim kembali ke aplikasi Flutter sebagai bagian dari respons.

Di sisi aplikasi Flutter, respons dari Django diolah. Jika proses autentikasi sukses, token disimpan untuk sesi pengguna dan mereka diarahkan ke halaman utama atau dashboard. Hal ini memungkinkan pengguna untuk mengakses berbagai fitur aplikasi sesuai dengan level akses mereka. Di sisi lain, jika autentikasi tidak berhasil, aplikasi Flutter akan menampilkan pesan error dan meminta pengguna untuk mencoba lagi. Setelah login berhasil, pengguna dapat mengakses dan berinteraksi dengan berbagai menu dan fitur aplikasi, yang kini aman berkat proses verifikasi identitas oleh Django. Proses ini memastikan keamanan dalam pertukaran data dan menjamin bahwa hanya pengguna yang terverifikasi yang dapat mengakses fitur-fitur tertentu di dalam aplikasi.

## Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing

```Scaffold```: Widget ini digunakan sebagai kerangka dasar untuk layout halaman di Flutter. Ini menyediakan struktur dasar seperti appBar, body, dan lainnya.

```AppBar```: Widget ini digunakan untuk menampilkan app bar di bagian atas layar. Di dalamnya, Anda menampilkan judul halaman yang diambil dari data item.

```Form```: Widget ini digunakan untuk membuat formulir yang dapat diisi oleh pengguna. Ini membantu dalam validasi dan pengelolaan data formulir.

```IconButton```: Widget ini digunakan untuk menampilkan tombol ikon di app bar. Dalam kasus ini, Anda menggunakan ikon panah kembali (Icons.arrow_back) yang, ketika ditekan, akan memicu fungsi untuk kembali ke halaman sebelumnya (Navigator.pop(context)).

```Padding```: Widget ini digunakan untuk memberikan padding di sekitar konten lainnya, dalam hal ini di sekitar kolom yang menampilkan detail produk.

```Column```: Widget ini digunakan untuk menata beberapa widget lainnya secara vertikal. Ini digunakan untuk menampilkan informasi detail produk.

```Text```: Widget ini digunakan untuk menampilkan teks di layar. Dalam hal ini, digunakan untuk menampilkan berbagai atribut dari item, seperti nama, jumlah, harga, deskripsi, dan kategori

```TextFormField```: Widget ini digunakan untuk menerima input teks dari pengguna. Setiap TextFormField dikonfigurasi dengan dekorasi, validator, dan fungsi onChanged.

```ElevatedButton```: Widget ini digunakan untuk membuat tombol yang, ketika ditekan, akan menjalankan fungsi yang diberikan. Dalam kasus ini, tombol digunakan untuk mengirim data formulir ke server

```Align```: Widget ini digunakan untuk mengatur posisi widget anaknya, dalam hal ini digunakan untuk menempatkan tombol di bagian bawah

```SingleChildScrollView```: Widget ini memungkinkan pengguna untuk menggulir melalui konten yang mungkin tidak muat di layar

```FutureBuilder```: Widget ini digunakan untuk membangun UI berdasarkan hasil dari Future. Dalam kasus ini, digunakan untuk membangun UI setelah data dari fetchItem() diperoleh

```ListView.builder```: Widget ini digunakan untuk membuat daftar item yang dapat digulir. Ini membangun item daftar secara dinamis berdasarkan data yang diperoleh

```InkWell```: Widget ini digunakan untuk menangani ketukan pada item daftar. Ketika item ditekan, ia akan menavigasi ke DetailProductPage dengan data item yang relevan

```Container```: Widget ini digunakan untuk mengelompokkan dan memberikan margin, padding, dan tata letak lainnya pada item daftar

```SizedBox```: Widget ini digunakan untuk memberikan jarak antar widget dalam Column.

```ShopCard```: Widget ini adalah  widget kustom, digunakan untuk menampilkan kartu untuk setiap item dalam grid. Setiap ShopCard mewakili sebuah item dalam aplikasi

```LeftDrawer```: Widget adalah widget kustom, digunakan untuk menampilkan menu drawer di sisi kiri layar.

```Drawer```: Widget ini digunakan untuk membuat menu drawer yang dapat ditarik dari sisi layar. Ini memberikan navigasi tambahan dalam aplikasi

```ListView```: Widget ini digunakan untuk membuat daftar item yang dapat discroll. Dalam konteks ini, digunakan untuk menampilkan item-item dalam drawer.

```ListTile```: Widget ini digunakan untuk membuat item yang dapat diklik di dalam ListView. Dalam hal ini, digunakan untuk membuat item navigasi di drawer

```Icon```: Widget ini digunakan untuk menampilkan ikon di samping teks dalam ListTile

```Material```: Widget ini digunakan sebagai dasar untuk menampilkan komponen UI yang mengikuti Material Design. Di sini, digunakan untuk memberikan warna latar belakang pada kartu

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step

### :white_check_mark: Membuat halaman login pada proyek tugas flutter

Pada bagian ini, saya mulai dengan membuat sebuah aplikasi baru bernama ```authentication``` pada projek Django saya. Kemudian, saya membuat fungsi ```login``` pada ```authentication/views.py```. Sebelum itu, saya juga menambahkan ```corsheaders``` yang sudah saya install ke ```settings.py```. Lalu, saya melakukan routing pada ```urls.py```. 

Selanjutnya, pada proyek flutter, saya membuat file baru bernama ```login.dart``` dalam folder ```screens``` yang memuat widget untuk login ke aplikasi dengan menambahkan provider terlebih dahulu. Saya mengisi bagian ```login,dart``` saya dengan kode berikut

```
import 'package:glowventory/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
    runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
const LoginApp({super.key});

@override
Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login',
        theme: ThemeData(
            primarySwatch: Colors.blue,
    ),
    home: const LoginPage(),
    );
    }
}

class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Text('Login'),
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                labelText: 'Username',
                            ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                            ),
                            obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                                String username = _usernameController.text;
                                String password = _passwordController.text;

                                // Cek kredensial
                                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                // gunakan URL http://10.0.2.2/
                                final response = await request.login("http://127.0.0.1:8000/auth/login/", {
                                'username': username,
                                'password': password,
                                });
                    
                                if (request.loggedIn) {
                                    String message = response['message'];
                                    String uname = response['username'];
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                    ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                            SnackBar(content: Text("$message Selamat datang, $uname.")));
                                    } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: const Text('Login Gagal'),
                                            content:
                                                Text(response['message']),
                                            actions: [
                                                TextButton(
                                                    child: const Text('OK'),
                                                    onPressed: () {
                                                        Navigator.pop(context);
                                                    },
                                                ),
                                            ],
                                        ),
                                    );
                                }
                            },
                            child: const Text('Login'),
                        ),
                    ],
                ),
            ),
        );
    }
}
```

Dan untuk mengintegrasikan loginpage saya ke main, saya mengubah kode ```main.dart``` menjadi seperti berikut

```
child: MaterialApp(
 title: 'Flutter App',
 theme: ThemeData(
     colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
     useMaterial3: true,
 ),
 home: LoginPage()),
```

### :white_check_mark: Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter

Langkah pertama saya adalah menginstall provider pada proyek Django dengan menjalankan perintah
```
flutter pub add provider
flutter pub add pbp_django_auth
```

Setelah itu, saya mengubah kode pada ```main.dart``` agar bisa mengakses package provider dengan menyediakan ```CookieRequest``` library ke semua child widgets dengan menggunakan ```Provider```.

```
class MyApp extends StatelessWidget {
 const MyApp({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
     return Provider(
         create: (_) {
             CookieRequest request = CookieRequest();
             return request;
         },
         child: MaterialApp(
             title: 'Flutter App',
             theme: ThemeData(
                 colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                 useMaterial3: true,
             ),
             home: LoginPage()),
            );
    }
}
```

### :white_check_mark:Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy

Checklist ini saya mulai dengan menambahkan file baru

Pada bagian ini, saya mengcopy data JSON dan paste di Quicktype. Setelah itu saya membuat folder baru dalam ```lib``` dengan nama ```models``` dan membuat file baru bernama ```item.dart``` mengikuti tugas Django saya. Kemudian saya mengcopy hasil kode dari Quicktype dan saya paste untuk membuat model pada flutter. 

Untuk membuat halaman detail yang menunjukkan nama, amount, dan deskripsi produk, saya membuat file baru bernama ```list_product.dart```. Sebelum itu saya menambahkan package HTTP untuk menlakukan perintah HTTP request. Kemudian, pada ```list_product.dart``` saya imprt library menambahkan kode yang menampilkan nama, amount, dan deskripsi produk dengan kode berikut

```
import 'package:flutter/material.dart';
import 'package:glowventory/screens/detail_product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:glowventory/models/item.dart';
import 'package:glowventory/widgets/left_drawer.dart';

class ItemPage extends StatefulWidget {
    const ItemPage({Key? key}) : super(key: key);

    @override
    _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
Future<List<Item>> fetchItem() async {
    var url = Uri.parse(
        'http://127.0.0.1:8000/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Item
    List<Item> list_item = [];
    for (var d in data) {
        if (d != null) {
            list_item.add(Item.fromJson(d));
        }
    }
    return list_item;
}
...
}
```
### :white_check_mark: Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.

Untuk membuat halaman ini, saya membuat file baru pada ```screens``` dengan nama ```detail_product.dart``` dan saya tambahkan kode untuk memunculkan keseluruhan model yang saya miliki.

Kemudian, untuk mengintegrasikannya, saya menambahkan Widget Inkwell pada ```list_product.dart```. Inkwell akan mendirect ketika user menekan product ke page ```detail_product.dart``` dengan kode ini

```
  itemBuilder: (_, index) {
    var item = snapshot.data![index];

    return InkWell(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) =>
            DetailProductPage(item: item),
          ),
        );
      },
    ....
```













