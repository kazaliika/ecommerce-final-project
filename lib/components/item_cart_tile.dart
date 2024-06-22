import 'package:flutter/material.dart';

import '../models/item.dart';
import '../utils/colors.dart';

class CartTile extends StatefulWidget {
  const CartTile({
    super.key,
    required this.item,
    required this.count,
    required this.onChangedCheckbox,
    required this.removeItem,
    required this.addItem,
  });

  final Item item;
  final int count;
  final Function(bool?)? onChangedCheckbox;
  final VoidCallback removeItem;
  final VoidCallback addItem;

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = false;
  }

  void toggleCheckbox(bool? value) {
    setState(() {
      isChecked = value!;
    });
    widget.onChangedCheckbox!(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Row(
          children: [
            // CheckBox
            Checkbox(
              value: isChecked,
              onChanged: toggleCheckbox,
              activeColor: blueColor,
            ),

            // image product
            Container(
              height: 100,
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(widget.item.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),

            // information product
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      widget.item.title,
                      maxLines: 2,
                      softWrap: true, // Ensure text wraps to next line
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    // amount of product and price
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Counter amount of product
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            width: 110,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Button remove item
                                Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: IconButton(
                                    onPressed: () => widget.removeItem(),
                                    icon: Icon(
                                      Icons.remove,
                                      size: 18,
                                    ),
                                  ),
                                ),

                                // amount of item
                                Text(
                                  "${widget.count}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),

                                // Buttom add item
                                Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: IconButton(
                                    onPressed: () => widget.addItem(),
                                    icon: Icon(
                                      Icons.add,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Price
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "\$ ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${widget.item.price}",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
