import 'package:ecommerce_final_project/models/item.dart';
import 'package:flutter/material.dart';

class Favorite extends ChangeNotifier{
  List<Item> _itemsFavorite =
 [];
  // get user favorite list
  List<Item> get favoriteList => _itemsFavorite;

  // add to favorite list
  void addItemFavorite(Item item) {
    _itemsFavorite.add(item);
    notifyListeners();
  }

  // remove to favorite list
  void removeItemFavorite(Item item) {
    _itemsFavorite.remove(item);
    notifyListeners();
  }


  bool isFavorite(Item item) {
    return _itemsFavorite.contains(item);
  }
}
