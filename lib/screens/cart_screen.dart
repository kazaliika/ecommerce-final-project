import 'package:ecommerce_final_project/utils/colors.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String imgPath =
      "https://images.unsplash.com/photo-1603252109612-24fa03d145c8?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

  bool checkbox = false;

  void isChecked(value) {
    setState(() {
      checkbox = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 120,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15, top: 40, bottom: 50),
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "My Cart",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CartTile(
                imgPath: imgPath,
                name: "Bix Bag Limited Edition 229",
                variant: "Black",
                count: 1,
                price: 26.00,
                isChecked: (value){
                  checkbox = value!;
                }
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  color: Colors.black12,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CartTile extends StatefulWidget {
  const CartTile({
    super.key,
    required this.imgPath,
    required this.name,
    required this.variant,
    required this.count,
    required this.price,
    required this.isChecked,
  });

  final String imgPath;
  final String name;
  final String variant;
  final int count;
  final double price;
  final Function(bool?)? isChecked;

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  late int amountProduct;
  @override
  void initState() {
    super.initState();
    amountProduct = widget.count > 0 ? widget.count : 1;
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
          return AlertDialog(
            title: Text('You will remove this product, are you sure?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  // Logic to remove the product goes here
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('Remove'),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        amountProduct--;
      });
    }
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
              value: false,
              onChanged: widget.isChecked,
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
                      "Bix Bag Limited Edition 229",
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
