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
  @override
  Widget build(BuildContext context) {
    final items = (widget.data == null || widget.data == []) ? context.watch<Shop>().itemList : widget.data;

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
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 9 / 16,
          ),
          itemCount: items!.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ProductTile(
              item: item,
            );
          },
        ),
      ),
    );
  }
}
