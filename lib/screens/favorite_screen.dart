import 'package:ecommerce_final_project/components/product_tile.dart';
// import 'package:ecommerce_final_project/models/favorite.dart';
import 'package:flutter/material.dart';

import '../models/item.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Item> listFavorite;

  FavoriteScreen({required this.listFavorite});

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final filteredItems = widget.listFavorite.where((item) {
      return item.titleProduct
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          item.brandProduct.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Items'),
        centerTitle: true,
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
            child: ListView.builder(
              itemCount: (filteredItems.length / 2).ceil(),
              itemBuilder: (context, index) {
                final item1 = filteredItems[index * 2];
                final item2 = index * 2 + 1 < filteredItems.length
                    ? filteredItems[index * 2 + 1]
                    : null;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ProductTile(
                          titleProduct: item1.titleProduct,
                          brandProduct: item1.brandProduct,
                          price: item1.price,
                          imagePath: item1.imagePath,
                          isFavorite: true,
                          onChangeFavorite: () {
                            setState(() {
                              widget.listFavorite.remove(item1);
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 16),
                      item2 != null
                          ? Expanded(
                              child: ProductTile(
                                titleProduct: item2.titleProduct,
                                brandProduct: item2.brandProduct,
                                price: item2.price,
                                imagePath: item2.imagePath,
                                isFavorite: true,
                                onChangeFavorite: () {
                                  setState(() {
                                    widget.listFavorite.remove(item2);
                                  });
                                },
                              ),
                            )
                          : Expanded(
                              child:
                                  Container()), // Placeholder for empty space
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
