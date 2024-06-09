import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Category"),
      ),
    );
  }
}