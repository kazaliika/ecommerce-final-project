import 'package:ecommerce_final_project/controller/firebase_auth_services.dart';
import 'package:ecommerce_final_project/screens/home/category_screen.dart';
import 'package:ecommerce_final_project/screens/home/home_screen.dart';
import 'package:ecommerce_final_project/screens/list_product.dart';
import 'package:ecommerce_final_project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutHome extends StatefulWidget {
  const LayoutHome({super.key});

  @override
  State<LayoutHome> createState() => _LayoutHomeState();
}

class _LayoutHomeState extends State<LayoutHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AuthController authController = Get.find<AuthController>();

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
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 25),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            child: Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            // Greet User Text
            Text(
              'Hi, ${authController.user.value?.displayName ?? 'User'}',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            // CTA Text
            Text(
              "Let's go shopping",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: [
          // Search
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ListProduct(); // Mengarahkan ke layar ListProduct
                      },
                    ),
                  );
                },
                icon: Icon(Icons.search)),
          ),

          // Notification
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: IconButton(
                onPressed: () {}, icon: Icon(Icons.notifications_outlined)),
          ),
          SizedBox(
            width: 15,
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
              text: "Home",
            ),
            // Tab Category
            Tab(
              text: "Category",
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: TabBarView(
          controller: _tabController,
          children: [
            HomeScreen(tabController: _tabController),
            CategoryScreen(tabController: _tabController),
          ],
        ),
      ),
    );
  }
}
