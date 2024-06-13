import 'package:ecommerce_final_project/screens/home/detail_product_screen.dart';
import 'package:ecommerce_final_project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.titleProduct,
    required this.brandProduct,
    required this.price,
    required this.imagePath,
    required this.isFavorite,
    required this.onChangeFavorite,
  });

  final String titleProduct;
  final String brandProduct;
  final double price;
  final String imagePath;
  final bool isFavorite;
  final VoidCallback onChangeFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      image: NetworkImage(imagePath),
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
                  onPressed: onChangeFavorite,
                ),
              ),
            ],
          ),

          // Title Product
          Text(
            titleProduct,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(
            height: 5,
          ),

          // Brand Product
          Text(
            brandProduct,
            style: TextStyle(
              fontSize: 12,
              color: fontGrayColor,
            ),
          ),

          // Price Product
          Text(
            "\$$price",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
