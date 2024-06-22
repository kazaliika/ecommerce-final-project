// lib/screens/settings/favorite_screen.dart
import 'package:ecommerce_final_project/components/product_tile.dart';
import 'package:ecommerce_final_project/models/favorite.dart';
import 'package:ecommerce_final_project/screens/cart_screen.dart';
import 'package:ecommerce_final_project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Mendefinisikan layar FavoriteScreen sebagai StatefulWidget
class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({super.key});

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

// Mendefinisikan state untuk FavoriteScreen
class _FavoriteScreenState extends State<FavoriteScreen> {
  String searchQuery = ""; // Inisialisasi variabel untuk query pencarian

  @override
  Widget build(BuildContext context) {
    // Mengambil daftar favorit dari Provider
    final favoritelist = context.watch<Favorite>().favoriteList;

    // Memfilter daftar favorit berdasarkan query pencarian
    final filteredList = favoritelist.where((item) {
      return item.title.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white, // Mengatur warna latar belakang
      appBar: AppBar(
        backgroundColor: Colors
            .transparent, // Mengatur warna latar belakang AppBar menjadi transparan
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 120, // Mengatur tinggi toolbar
        centerTitle: true, // Mengatur judul agar berada di tengah
        title: Text(
          "Favorite Products", // Judul AppBar
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return CartScreen(); // Navigasi ke layar CartScreen
                  },
                ),
              );
            },
            icon: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(
                Icons.shopping_bag_outlined, // Ikon keranjang belanja
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize:
              Size(double.infinity, 50), // Mengatur ukuran PreferredSize
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery =
                      value; // Mengubah nilai searchQuery saat teks berubah
                });
              },
              decoration: InputDecoration(
                hintText: 'Search...', // Placeholder untuk TextField
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: blueColor,
                      width: 2), // Border saat TextField fokus
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: fontGrayColor), // Border default TextField
                ),
                prefixIcon: Icon(
                    Icons.search), // Ikon pencarian di sebelah kiri TextField
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Expanded(
              child: filteredList.length >
                      0 // Mengecek apakah ada item dalam daftar yang difilter
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Jumlah kolom dalam grid
                        crossAxisSpacing: 20, // Jarak antar kolom
                        mainAxisSpacing: 20, // Jarak antar baris
                        childAspectRatio: 9 / 16, // Rasio aspek item grid
                      ),
                      itemCount: filteredList
                          .length, // Jumlah item dalam daftar yang difilter
                      itemBuilder: (context, index) {
                        final item = filteredList[
                            index]; // Mengambil item pada indeks tertentu

                        return ProductTile(
                          item:
                              item, // Menampilkan item menggunakan widget ProductTile
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        "You don't have a favorite item, please add your favorite item.", // Pesan jika tidak ada item favorit
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: fontGrayColor), // Gaya teks pesan
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
