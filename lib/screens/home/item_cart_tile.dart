import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CartTile extends StatefulWidget {
  const CartTile({
    super.key,
    required this.imgPath,
    required this.name,
    required this.variant,
    required this.count,
    required this.price,
    required this.onChangedCheckbox,
    required this.deletedItem,
  });

  final String imgPath;
  final String name;
  final String variant;
  final int count;
  final double price;
  final Function(bool?)? onChangedCheckbox;
  final VoidCallback deletedItem;

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  late int amountProduct;
  late bool isChecked;
  
  @override
  void initState() {
    super.initState();
    amountProduct = widget.count > 0 ? widget.count : 1;
    isChecked = false;
  }

  void addProduct() {
    setState(() {
      amountProduct++;
    });
  }

  void removeProduct() {
    if (amountProduct == 1) {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(25),
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text Alert
                  Text(
                    "This item will be deleted, are you sure?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // Row of button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Button Cancel
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.redAccent),
                            foregroundColor:
                                WidgetStatePropertyAll(Colors.white)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancel"),
                      ),
                      SizedBox(
                        width: 10,
                      ),

                      // Button Accept
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                                side: BorderSide(color: fontGrayColor),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          backgroundColor: WidgetStatePropertyAll(Colors.white),
                          foregroundColor: WidgetStatePropertyAll(Colors.black),
                        ),
                        onPressed: widget.deletedItem,
                        child: Text("yes, I'm sure"),
                      ),
                    ],
                  )
                ],
              ),
            ),
            backgroundColor: Colors.white,
          );
        },
      );
    } else {
      setState(() {
        amountProduct--;
      });
    }
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
                      image: NetworkImage(widget.imgPath),
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
                      widget.name,
                      maxLines: 2,
                      softWrap: true, // Ensure text wraps to next line
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Variant
                    Row(
                      children: [
                        Text(
                          "Variant: ",
                          style: TextStyle(
                            fontSize: 12,
                            color: fontGrayColor,
                          ),
                        ),
                        Text(
                          widget.variant,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
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
                                    onPressed: () => removeProduct(),
                                    icon: Icon(
                                      Icons.remove,
                                      size: 18,
                                    ),
                                  ),
                                ),

                                // amount of item
                                Text(
                                  "$amountProduct",
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
                                    onPressed: () => addProduct(),
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
                                  "${widget.price}",
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
