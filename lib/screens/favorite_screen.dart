// lib/screens/settings/favorite_screen.dart
import 'package:ecommerce_final_project/components/product_tile.dart';
import 'package:ecommerce_final_project/models/favorite.dart';
import 'package:ecommerce_final_project/screens/cart_screen.dart';
import 'package:ecommerce_final_project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({super.key});

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final favoritelist = context.watch<Favorite>().favoriteList;

    // Filter favorite list based on the search query
    final filteredList = favoritelist.where((item) {
      return item.title!
          .toLowerCase()
          .contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 120,
        centerTitle: true,
        title: Text(
          "Favorite Products",
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
                    return CartScreen();
                  },
                ),
              );
            },
            icon: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(
                Icons.shopping_bag_outlined,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: blueColor, width: 2),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: fontGrayColor),
                ),
                prefixIcon: Icon(Icons.search),
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
              child: filteredList.length > 0
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 9 /
                            16, // Sesuaikan dengan rasio aspek yang diinginkan
                      ),
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        final item = filteredList[index];

                        return ProductTile(
                          item: item,
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        "You don't have a favorite item, please add your favorite item.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: fontGrayColor),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
