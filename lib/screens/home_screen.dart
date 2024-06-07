import 'package:ecommerce_final_project/screens/cart_screen.dart';
import 'package:ecommerce_final_project/screens/favorite_screen.dart';
import 'package:ecommerce_final_project/screens/profile_screen.dart';
import 'package:ecommerce_final_project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

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
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0),
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
            // Greet User Text
            Text(
              'Hi, Sigit',
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
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),

          // Notification
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notifications_outlined)),
          SizedBox(
            width: 15,
          ),
        ],
        bottom: TabBar(
          dividerColor: Colors.transparent,
          labelColor: Colors.black,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal, color: Colors.black54),
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
      ),
    );
  }
}
