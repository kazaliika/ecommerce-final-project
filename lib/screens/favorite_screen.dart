import 'package:ecommerce_final_project/components/product_tile.dart';
import 'package:ecommerce_final_project/models/favorite.dart';
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
              itemCount: favoritelist.length,
              itemBuilder: (context, index) {
                final item = favoritelist[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ProductTile(
                          item: item,
                        ),
                      ),
                      SizedBox(width: 16),
                      // Placeholder for empty space
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
