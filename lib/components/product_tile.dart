import 'package:ecommerce_final_project/models/item.dart';
import 'package:ecommerce_final_project/screens/detail_product_screen.dart';
// import 'package:ecommerce_final_project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:provider/provider.dart';

import '../models/favorite.dart';

class ProductTile extends StatefulWidget {
  const ProductTile({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {

  // add to favorite
  void addToFavoriteList(BuildContext context) {
    context.read<Favorite>().addItemFavorite(widget.item);
  }

  // remove from favorite
  void removeFromFavoriteList(BuildContext context) {
    context.read<Favorite>().removeItemFavorite(widget.item);
  }

  void toggleFavorite() {
    if (context.read<Favorite>().isFavorite(widget.item)) {
      removeFromFavoriteList(context);
    } else {
      addToFavoriteList(context);
    }
    print(context.read<Favorite>().favoriteList.length);
  }

  @override
  Widget build(BuildContext context) {
    bool isFavorite = context.watch<Favorite>().isFavorite(widget.item);

    return GestureDetector(
       onTap: () {
        pushScreen(
          context,
          screen: DetailProductScreen(item: widget.item,),
        );
      },
      child: Container(
        child: Column(
          children: [
            // Image Product
            Stack(
              alignment: Alignment.topRight,
              children: [
                AspectRatio(
                  aspectRatio: 3 / 4,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(widget.item.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.all(10),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black54,
                  ),
                  child: IconButton(
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: isFavorite ? Colors.red : Colors.white,
                      size: 15,
                    ),
                    onPressed: () => toggleFavorite(),
                  ),
                ),
              ],
            ),
      
            // Title Product
            Text(
              widget.item.title,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
      
            SizedBox(
              height: 5,
            ),
      
            // Brand Product
            // Text(
            //   widget.item.brandProduct,
            //   style: TextStyle(
            //     fontSize: 12,
            //     color: fontGrayColor,
            //   ),
            // ),
      
            // Price Product
            Text(
              "\$${widget.item.price}",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
