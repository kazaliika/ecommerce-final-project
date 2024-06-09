import 'package:ecommerce_final_project/utils/colors.dart';
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
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          height: 150,
          padding: EdgeInsets.all(25),
          margin: EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1603252109612-24fa03d145c8?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
            color: grayColor,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: (index % 2 == 0)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: (CrossAxisAlignment.start),
                          children: [
                            // Name of Category
                            Text(
                              'New Arrivals',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // Count of Product
                            Text(
                              '208 Product',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ),
              ),
              Expanded(
                child: Container(
                  child: (index % 2 != 0)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // Name of Category
                            Text(
                              'New Arrivals',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // Count of Product
                            Text(
                              '208 Product',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
