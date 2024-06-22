import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/product_tile.dart';
import '../models/item.dart';
import '../models/shop.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key, this.title, this.data});

  final String? title;
  final List<Item>? data;

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  String searchQuery = ""; // Inisialisasi variabel untuk query pencarian
  String filterOption = "None"; // Inisialisasi variabel untuk opsi filter

  @override
  Widget build(BuildContext context) {
    final items = (widget.data == null || widget.data!.isEmpty)
        ? context.watch<Shop>().itemList
        : widget.data;

    // Memfilter dan mengurutkan daftar produk berdasarkan query pencarian dan opsi filter
    var filteredItems = items!.where((item) {
      return item.title.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    if (filterOption == "Harga Tertinggi ke Terendah") {
      filteredItems.sort((a, b) => b.price.compareTo(a.price));
    } else if (filterOption == "Harga Terendah ke Tertinggi") {
      filteredItems.sort((a, b) => a.price.compareTo(b.price));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 120,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, top: 40, bottom: 50),
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          (widget.title == null) ? "All Product" : "${widget.title}",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize:
              Size(double.infinity, 100), // Mengatur ukuran PreferredSize
          child: Column(
            children: [
              Padding(
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
                          color: Colors.blue,
                          width: 2), // Border saat TextField fokus
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Colors.grey), // Border default TextField
                    ),
                    prefixIcon: Icon(Icons
                        .search), // Ikon pencarian di sebelah kiri TextField
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: DropdownButton<String>(
                  value: filterOption,
                  onChanged: (String? newValue) {
                    setState(() {
                      filterOption = newValue!;
                    });
                  },
                  items: <String>[
                    'None',
                    'Harga Tertinggi ke Terendah',
                    'Harga Terendah ke Tertinggi'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  isExpanded: true,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            SizedBox(
                height: 30), // Menambahkan jarak antara SearchBar dan GridView
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 9 / 16,
                ),
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  return ProductTile(
                    item: item,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
