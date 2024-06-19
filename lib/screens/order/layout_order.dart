import 'package:ecommerce_final_project/screens/cart_screen.dart';
import 'package:ecommerce_final_project/screens/order/history_screen.dart';
import 'package:ecommerce_final_project/screens/order/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../utils/colors.dart';

class LayoutOrder extends StatefulWidget {
  const LayoutOrder({super.key});

  @override
  State<LayoutOrder> createState() => _LayoutOrderState();
}

class _LayoutOrderState extends State<LayoutOrder>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 120,
        centerTitle: true,
        title: Text(
          "My Order",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              pushScreen(context, screen: CartScreen());
            },
            icon: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(
                Icons.shopping_bag_outlined,
              ),
            ),
          ),
        ],
        bottom: TabBar(
          dividerColor: Colors.transparent,
          labelColor: Colors.black,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle:
              TextStyle(fontWeight: FontWeight.normal, color: Colors.black54),
          indicatorColor: blueColor,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 50),
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
          controller: _tabController,
          tabs: [
            // Tab Home
            Tab(
              text: "My Order",
            ),

            // Tab Category
            Tab(
              text: "History",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          OrderScreen(tabController: _tabController),
          HistoryScreen(tabController: _tabController),
        ],
      ),
    );
  }
}
