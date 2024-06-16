import 'package:ecommerce_final_project/models/item.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  // Item for sale
  final List<Item> _shop = [
    Item(
      titleProduct: "Product 1",
      brandProduct: "Samseng",
      price: 22.00,
      imagePath: "https://picsum.photos/id/237/200/300",
    ),
    Item(
      titleProduct: "Product 2",
      brandProduct: "Xiomay",
      price: 10.00,
      imagePath: "https://picsum.photos/id/235/200/300",
    ),
    Item(
      titleProduct: "Product 3",
      brandProduct: "Melon",
      price: 24.00,
      imagePath: "https://picsum.photos/id/233/200/300",
    ),
    Item(
      titleProduct: "Product 4",
      brandProduct: "otto",
      price: 18.00,
      imagePath: "https://picsum.photos/id/231/200/300",
    ),
    Item(
      titleProduct: "Product 5",
      brandProduct: "nokao",
      price: 15.00,
      imagePath: "https://picsum.photos/id/229/200/300",
    ),
  ];

  // user cart
  Map<Item, int> _userCart = {};

  // get product list
  List<Item> get itemList => _shop;

  // get user cart
  Map<Item, int> get userCart => _userCart;

  // add item to cart
  void addToCart(Item item) {
    // if user have same item in the cart, then increase the quantity of item
    if (_userCart.containsKey(item)) {
      _userCart[item] = _userCart[item]! + 1;

      // if user don't have same item in the cart, then add the item to the user cart
    } else {
      _userCart[item] = 1;
    }
    notifyListeners();
  }

  // remove item form cart
  void removeToCart(Item item) {
    if (_userCart.containsKey(item)) {
      // if user have the item more then 1 in cart, then deleted decrease the quantity of item.
      if (_userCart[item]! > 1) {
        _userCart[item] = _userCart[item]! - 1;

        // if user only have 1 item in the cart, then delete the item.
      } else {
        _userCart.remove(item);
      }
    }
    notifyListeners();
  }
}
