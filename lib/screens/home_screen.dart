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

class _HomeScreenState extends State<HomeScreen> {
  

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
      ),
      body: Text("Home Page"),
    );
  }
}
