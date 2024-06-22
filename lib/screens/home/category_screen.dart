import 'package:ecommerce_final_project/models/category_item.dart';
import 'package:ecommerce_final_project/screens/list_product.dart';
import 'package:ecommerce_final_project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final categoryList = context.watch<CategoryItem>().getCategory;

    return ListView.builder(
      itemCount: categoryList.length,
      itemBuilder: (context, index) {
        final data = categoryList.elementAt(index);
        print("${data['title']} : ${data['items'].length}");
        return GestureDetector(
          onTap: () => pushScreen(context, screen: ListProduct(title: data['title'], data: data['items'],)),
          child: Container(
            height: 150,
            padding: EdgeInsets.all(25),
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('${data['banner']}'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
              color: grayColor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: (index % 2 == 0) ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                      children: [
                        // Name of Category
                        Text(
                          '${data['title']}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
          
                        // Count of Product
                        Text(
                          '${data['count']} Product',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
