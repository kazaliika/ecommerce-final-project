import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/item.dart';

class Shop extends ChangeNotifier {
  List<Item> _shop = [];
  Map<Item, int> _userCart = {};

  Shop() {
    fetchItems();
  }

  List<Item> get itemList => _shop;
  Map<Item, int> get userCart => _userCart;

  Future<void> fetchItems() async {
    const url = 'https://fakestoreapi.com/products';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        _shop = data.map((json) => Item.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load items');
      }
    } catch (error) {
      print('Error fetching items: $error');
    }
  }

  void addToCart(Item item) {
    if (_userCart.containsKey(item)) {
      _userCart[item] = _userCart[item]! + 1;
    } else {
      _userCart[item] = 1;
    }
    notifyListeners();
  }

  void removeOneFromCart(Item item) {
    if (_userCart.containsKey(item)) {
      if (_userCart[item]! > 1) {
        _userCart[item] = _userCart[item]! - 1;
      } else {
        _userCart.remove(item);
      }
    }
    notifyListeners();
  }

  void removeFromCart(Item item) {
    _userCart.remove(item);
    notifyListeners();
  }
}
