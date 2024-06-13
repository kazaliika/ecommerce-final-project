import 'package:ecommerce_final_project/components/product_tile.dart';
import 'package:ecommerce_final_project/models/favorite.dart';
import 'package:flutter/material.dart';

import '../models/item.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  String searchQuery = "";

  Favorite favoriteData = Favorite();

  late Function(Item) onFavoriteToggle;

  void toggleFavorite(Item item) {
    print(favoriteData.itemsFavorite.length);
    setState(() {
      if (favoriteData.itemsFavorite.contains(item)) {
        favoriteData.removeItemFavorite(item);
      } else {
        favoriteData.addItemFavorite(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final filteredItems = favoriteItems
    //     .where((item) =>
    //         item.titleProduct
    //             .toLowerCase()
    //             .contains(searchQuery.toLowerCase()) ||
    //         item.brandProduct.toLowerCase().contains(searchQuery.toLowerCase()))
    //     .toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${favoriteData.itemsFavorite.length}',
            textAlign: TextAlign.center),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 9 / 16, // Rasio aspek item grid
              ),
              itemCount: favoriteData.itemsFavorite.length,
              itemBuilder: (context, index) {
                final item = favoriteData.itemsFavorite[index];
                bool isFavorite = false;
                return ProductTile(
                  titleProduct: item.titleProduct,
                  brandProduct: item.brandProduct,
                  price: item.price,
                  imagePath: item.imagePath,
                  isFavorite: isFavorite,
                  onChangeFavorite: () => toggleFavorite(item),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
