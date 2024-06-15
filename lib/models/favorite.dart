import 'package:ecommerce_final_project/models/item.dart';

class Favorite {
  List<Item> itemsFavorite = [];

  // add to favorite list
  void addItemFavorite(Item item) {
    itemsFavorite.add(item);
  }

  // remove to favorite list
  void removeItemFavorite(Item item) {
    itemsFavorite.remove(item);
  }
}
