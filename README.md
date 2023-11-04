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

### Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.

Saya memulai checklist ini dengan menjalankan command 
```
flutter create glowventory
```
Kemudian saya masuk ke direktori glowventory dengan command ```glowventory```. Kedua hal tersebut saya lakukan untuk membuat sebuah proyek flutter baru bernama ```glowventory```. Kemudian, saya akan menjalankan proyek menggunakan comman ```flutter run```

### Membuat tiga tombol sederhana dengan ikon dan teks untuk: Melihat daftar item (Lihat Item), Menambah item (Tambah Item), dan Logout (Logout).

Saya memulai checklist dengan membuat sebuah class ```Item``` yang isi atributnya nama dan icon, dan karena saya juga mengerjakan bonus, saya tambahkan satu atribut lagi yaitu color. Kemudian, saya membuat sebuah list dalam class ```MyHomePage``` yang isinya tombol-tombol yang ingin saya tunjukkan.

```
  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, Colors.blue[900]!), // Warna biru tua
    ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.blue[700]!), // Warna biru sedang
    ShopItem("Logout", Icons.logout, Colors.blue[500]!), // Warna biru muda
  ];
```

### Memunculkan Snackbar dengan tulisan: "Kamu telah menekan tombol Lihat Item" ketika tombol Lihat Item ditekan, "Kamu telah menekan tombol Tambah Item" ketika tombol Tambah Item ditekan, "Kamu telah menekan tombol Logout" ketika tombol Logout ditekan.

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
```

Dengan line of code di atas, ketika user menekan suatu icon atau tombol, akan muncul snackbar yang mengatakan "kamu telah menekan tombol "nama item".



