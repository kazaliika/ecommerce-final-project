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
    'assets/images/banner_1.png',
    'assets/images/banner_2.png',
    'assets/images/Banner_3.png',
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
                        image: AssetImage(i),
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
