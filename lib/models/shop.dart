import 'package:ecommerce_final_project/models/item.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  // Item for sale
  final List<Item> _shop = [
    Item(
      titleProduct: "Product 1",
      brandProduct: "Samseng",
      price: 22.00,
      imagePath:
          "https://picsum.photos/id/237/200/300",
    ),
    Item(
      titleProduct: "Product 2",
      brandProduct: "Xiomay",
      price: 10.00,
      imagePath:
          "https://picsum.photos/id/235/200/300",
    ),
    Item(
      titleProduct: "Product 3",
      brandProduct: "Melon",
      price: 24.00,
      imagePath:
          "https://picsum.photos/id/233/200/300",
    ),
    Item(
      titleProduct: "Product 4",
      brandProduct: "otto",
      price: 18.00,
      imagePath:
          "https://picsum.photos/id/231/200/300",
    ),
    Item(
      titleProduct: "Product 5",
      brandProduct: "nokao",
      price: 15.00,
      imagePath:
          "https://picsum.photos/id/229/200/300",
    ),
  ];

  // user cart
  List<Item> _userCart = [];

  // get product list
  List<Item> get itemList => _shop;

  // get user cart
  List<Item> get cart => _userCart;

  // add item to cart
  void addToCart(Item item){
    _userCart.add(item);
    notifyListeners();
  }

  // remove item form cart
  void removeToCart(Item item){
    _userCart.remove(item);
    notifyListeners();
  }
}
