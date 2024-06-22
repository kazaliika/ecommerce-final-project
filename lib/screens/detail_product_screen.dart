import 'package:ecommerce_final_project/components/confirm_dialog.dart';
import 'package:ecommerce_final_project/models/shop.dart';
import 'package:ecommerce_final_project/screens/cart_screen.dart';
import 'package:ecommerce_final_project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorite.dart';
import '../models/item.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({super.key, required this.item});

  final Item item;

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  int selectedVariant = 0;

  // add item to cart
  void addItemToCart(BuildContext context, Item item) {
    showDialog(
      context: context,
      builder: (context) {
        return ConfirmDialog(
          title: "This item will be in your cart, are you sure?",
          onCancel: () => Navigator.of(context).pop(),
          onAccept: () {
            context.read<Shop>().addToCart(item);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

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

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Image Product
          Container(
            height: 450,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    widget.item.image,
                  ),
                  fit: BoxFit.cover),
            ),
          ),

          // Gradient top for make image contrast with Appbar
          Container(
            height: 450,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black54,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Appbar
              AppBar(
                backgroundColor: Colors.transparent,
                toolbarHeight: 120,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 40, bottom: 50),
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                centerTitle: true,
                title: Text(
                  "Detail Product",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return CartScreen();
                          },
                        ),
                      );
                    },
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              // Information of Product
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Information Product
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title of Product
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  child: Text(
                                    widget.item.title,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),

                              // Rating Product
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: Colors.orange,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${widget.item.rate}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "(${widget.item.review} Review)",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: fontGrayColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Favorite Button
                        IconButton(
                          onPressed: () {
                            toggleFavorite();
                            print("Favorite");
                          },
                          icon: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isFavorite
                                  ? Colors.redAccent
                                  : Colors.transparent,
                              border: Border.all(
                                color:
                                    isFavorite ? Colors.white : fontGrayColor,
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              color: isFavorite ? Colors.white : fontGrayColor,
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    // General Information Product
                    Expanded(
                      child: ListView(
                        children: [
                          // Caategory Product
                          Text(
                            "Category",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  border: Border.all(color: blueColor, width: 2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  widget.item.category,
                                  style: TextStyle(
                                    color: blueColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          // Description Product
                          Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          DescriptionText(
                            text: widget.item.description,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          // Profile Penjual
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Row(
                          //       children: [
                          //         // Image Profile Penjual
                          //         Container(
                          //           height: 50,
                          //           width: 50,
                          //           decoration: BoxDecoration(
                          //             shape: BoxShape.circle,
                          //             image: DecorationImage(
                          //               image: NetworkImage(
                          //                   widget.item.image),
                          //               fit: BoxFit.cover,
                          //             ),
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           width: 10,
                          //         ),

                          //         // Nama Penjual
                          //         Column(
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             Text(
                          //               "Babang Gantenz",
                          //               style: TextStyle(
                          //                 fontSize: 14,
                          //                 fontWeight: FontWeight.bold,
                          //               ),
                          //             ),
                          //             SizedBox(
                          //               height: 2,
                          //             ),
                          //             Row(
                          //               children: [
                          //                 Text(
                          //                   "104 Products",
                          //                   style: TextStyle(
                          //                     color: fontGrayColor,
                          //                     fontSize: 10,
                          //                   ),
                          //                 ),
                          //                 SizedBox(
                          //                   width: 10,
                          //                 ),
                          //                 Text(
                          //                   "1.3k Followers",
                          //                   style: TextStyle(
                          //                     color: fontGrayColor,
                          //                     fontSize: 10,
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //     ElevatedButton(
                          //       onPressed: () {},
                          //       style: ButtonStyle(
                          //         backgroundColor:
                          //             WidgetStatePropertyAll(blueColor),
                          //         foregroundColor:
                          //             WidgetStatePropertyAll(Colors.white),
                          //       ),
                          //       child: Text(
                          //         "Follow",
                          //         style: TextStyle(fontSize: 14),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Add to Cart Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 25,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: grayColor,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Price Information
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                          fontSize: 14,
                          color: fontGrayColor,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\$",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${widget.item.price}",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),

                  // Add to Cart Button
                  ElevatedButton(
                      onPressed: () => addItemToCart(context, widget.item),
                      style: ButtonStyle(
                        padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 15,
                          ),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          blueColor,
                        ),
                        foregroundColor: WidgetStatePropertyAll(
                          Colors.white,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_bag_outlined,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Add to Cart",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VariantSelect extends StatefulWidget {
  const VariantSelect({
    super.key,
    required this.imgPath,
    this.selectedVarientIndex,
  });

  final String imgPath;
  final int? selectedVarientIndex;

  @override
  State<VariantSelect> createState() => _VariantSelectState();
}

class _VariantSelectState extends State<VariantSelect> {
  int selectedVariant = 0;

  @override
  void initState() {
    super.initState();
    selectedVariant = widget.selectedVarientIndex ?? 0;
  }

  void changeVariant(int index) {
    setState(() {
      selectedVariant = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => changeVariant(index),
            child: Container(
              height: 40,
              width: 40,
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.imgPath),
                    fit: BoxFit.cover,
                  ),
                  border: (index == selectedVariant)
                      ? Border.all(color: blueColor, width: 2)
                      : Border.all(color: Colors.transparent, width: 2),
                  borderRadius: BorderRadius.circular(12)),
            ),
          );
        },
      ),
    );
  }
}

class DescriptionText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle style;

  DescriptionText(
      {required this.text, required this.maxLines, required this.style});

  @override
  _DescriptionTextState createState() => _DescriptionTextState();
}

class _DescriptionTextState extends State<DescriptionText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final textSpan = TextSpan(
      text: widget.text,
      style: widget.style,
    );

    final textPainter = TextPainter(
      text: textSpan,
      maxLines: widget.maxLines,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      maxWidth: MediaQuery.of(context).size.width,
    );

    final bool textExceedsMaxLines = textPainter.didExceedMaxLines;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.text,
          textAlign: TextAlign.justify,
          maxLines: _isExpanded ? null : widget.maxLines,
          overflow: TextOverflow.fade,
          style: widget.style,
        ),
        if (textExceedsMaxLines)
          GestureDetector(
            onTap: () {
              print("Read more");
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              _isExpanded ? "Read less" : "Read more",
              style: TextStyle(
                color: blueColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
