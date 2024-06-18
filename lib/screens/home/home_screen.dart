import 'package:dio/dio.dart';
import 'package:ecommerce_final_project/models/item.dart';
import 'package:ecommerce_final_project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:provider/provider.dart';

import '../../components/product_tile.dart';
import '../../models/shop.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Item>? products;

  Future<void> getData() async {
    const String apiUrl = "https://fakestoreapi.com/products";
    try {
      Response response = await Dio().get(apiUrl);
      if (response.data != null) {
        setState(() {
          products = (response.data as List)
              .map((productJson) => Item.fromJson(productJson))
              .toList();
        });
      } else {
        throw Exception("Api response is null or in an unexpected format");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final items = context.watch<Shop>().itemList;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Carousel Slider
          FlutterCarousel(
            options: CarouselOptions(
              height: 200,
              enableInfiniteScroll: true,
              showIndicator: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              floatingIndicator: false,
              indicatorMargin: 20,
              slideIndicator: CircularSlideIndicator(
                  itemSpacing: 15,
                  indicatorRadius: 4,
                  indicatorBorderWidth: 0.5,
                  currentIndicatorColor: blueColor,
                  indicatorBackgroundColor: grayColor),
            ),
            items: imgList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      color: grayColor,
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(i),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),

          SizedBox(
            height: 20,
          ),

          // Title Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Arrivals 🔥",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "see all",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: blueColor,
                  ),
                ),
              ),
            ],
          ),

          // GridView Item
          products == null
              ? Center(child: CircularProgressIndicator())
              : SizedBox(
                  height: 650,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 9 / 16,
                    ),
                    itemCount: products!.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return ProductTile(
                        item: item,
                        );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
