import 'package:ecommerce_final_project/models/category_item.dart';
import 'package:ecommerce_final_project/utils/colors.dart';
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
  String filterCategoryOption =
      "None"; // Inisialisasi variabel untuk opsi filter
  String filterSortOption = "None"; // Inisialisasi variabel untuk opsi filter
  double _bottomPositionContainer = -500;

  void inFilterContainer() {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _bottomPositionContainer = 0; // Ubah posisi container setelah delay
      });
    });
  }

  void outFilterContainer() {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _bottomPositionContainer = -500; // Ubah posisi container setelah delay
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryList = context.watch<CategoryItem>().getCategory;

    final items = (widget.data == null || widget.data!.isEmpty)
        ? context.watch<Shop>().itemList
        : widget.data;

    // Memfilter dan mengurutkan daftar produk berdasarkan query pencarian dan opsi filter
    var filteredItems = items!.where((item) {
      return item.title.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    if (filterSortOption == "tertinggi") {
      filteredItems.sort((a, b) => b.price.compareTo(a.price));
    } else if (filterSortOption == "terendah") {
      filteredItems.sort((a, b) => a.price.compareTo(b.price));
    }

    if (filterCategoryOption != "None") {
      filteredItems = filteredItems.where((item) {
        return item.category == filterCategoryOption;
      }).toList();
    }else{
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
              Size(double.infinity, 50), // Mengatur ukuran PreferredSize
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 0),
                            spreadRadius: 2,
                            blurRadius: 5),
                      ],
                    ),
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
                        border: InputBorder.none,
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(12),
                        //   borderSide: BorderSide(
                        //       color: Colors.black, width: 3), // Border default TextField
                        // ),
                        prefixIcon: Icon(Icons
                            .search), // Ikon pencarian di sebelah kiri TextField
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    inFilterContainer();
                  },
                  child: Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 0),
                            spreadRadius: 2,
                            blurRadius: 5),
                      ],
                    ),
                    child: Icon(
                      Icons.filter_list_rounded,
                      size: 30,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              children: [
                SizedBox(
                    height:
                        30), // Menambahkan jarak antara SearchBar dan GridView
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
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            left: 0,
            right: 0,
            bottom: _bottomPositionContainer,
            curve: Curves.easeInOutCubic,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              width: double.infinity,
              height: 380,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, -2),
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 5,
                    decoration: BoxDecoration(
                      color: grayColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        "Filters",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sort",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                filterSortOption = 'None';
                              });
                            },
                            child: Text(
                              "reset",
                              style: TextStyle(
                                fontSize: 12,
                                color: blueColor
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                filterSortOption = 'terendah';
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                  border: filterSortOption != 'terendah'
                                      ? Border.all(
                                          color: fontGrayColor, width: 1)
                                      : Border.all(color: blueColor, width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                "Harga Terendah",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: filterSortOption != 'terendah'
                                        ? fontGrayColor
                                        : blueColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                filterSortOption = 'tertinggi';
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              decoration: BoxDecoration(
                                  border: filterSortOption != 'tertinggi'
                                      ? Border.all(
                                          color: fontGrayColor, width: 1)
                                      : Border.all(color: blueColor, width: 2),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                "Harga Tertinggi",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: filterSortOption != 'tertinggi'
                                        ? fontGrayColor
                                        : blueColor),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Category",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                filterCategoryOption = 'None';
                              });
                            },
                            child: Text(
                              "reset",
                              style: TextStyle(
                                fontSize: 12,
                                color: blueColor
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 40,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryList.length,
                          itemBuilder: (context, index) {
                            final category = categoryList.elementAt(index);
                            final nameCategory = category['title'];
                            final slug = category['slug'];

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  filterCategoryOption = slug;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    border: filterCategoryOption != slug
                                        ? Border.all(
                                            color: fontGrayColor,
                                            width: 1,
                                          )
                                        : Border.all(
                                            color: blueColor,
                                            width: 2,
                                          ),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Text(
                                  "$nameCategory",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: filterCategoryOption != slug
                                          ? fontGrayColor
                                          : blueColor),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            outFilterContainer();
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(blueColor),
                            foregroundColor:
                                WidgetStatePropertyAll(Colors.white),
                          ),
                          child: Text(
                            "Apply",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
