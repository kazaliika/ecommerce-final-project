import 'package:ecommerce_final_project/models/item.dart';
import 'package:flutter/material.dart';

class CategoryItem extends ChangeNotifier {
  List<Map<String, dynamic>> _category = [
    {
      'title': "Men's Clothing",
      'slug': "men's clothing",
      'count': 0,
      'banner': "assets/images/men's clothing.png",
      'items': [],
    },
    {
      'title': "Women's Clothing",
      'slug': "women's clothing",
      'count': 0,
      'banner': "assets/images/women's clothing.png",
      'items': [],
    },
    {
      'title': "Jewelry",
      'slug': "jewelery",
      'count': 0,
      'banner': "assets/images/jewerly.png",
      'items': [],
    },
    {
      'title': "Electronics",
      'slug': "electronics",
      'count': 0,
      'banner': "assets/images/electronics.png",
      'items': [],
    },
  ];

  CategoryItem(List<Item> items){
    addIteminCategory(items);
  }

  List<Map<String, dynamic>> get getCategory => _category;

  void addIteminCategory(List<Item> items) {
    for (var category in _category) {
      String categoryName = category['slug'].toLowerCase();
      category['items'] = items.where((item) => item.category.toLowerCase() == categoryName).toList();
      category['count'] = category['items'].length;
    }
    notifyListeners();
  }
}
