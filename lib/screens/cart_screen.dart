import 'dart:math';

import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:ecommerce_final_project/utils/colors.dart';
import 'package:flutter/material.dart';

import 'home/item_cart_tile.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List data = [
    {
      "title": "Bix Bag Limited Edition 229",
      "variant": "Black",
      "price": 26.00,
      "image":
          "https://images.unsplash.com/photo-1603252109612-24fa03d145c8?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "title": "T-Shirt kiw kiw",
      "variant": "Black",
      "price": 30.00,
      "image":
          "https://images.unsplash.com/photo-1603252109612-24fa03d145c8?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "title": "Long Pants",
      "variant": "White",
      "price": 12.00,
      "image":
          "https://images.unsplash.com/photo-1603252109612-24fa03d145c8?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "title": "Long Pants",
      "variant": "White",
      "price": 12.00,
      "image":
          "https://images.unsplash.com/photo-1603252109612-24fa03d145c8?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "title": "Long Pants",
      "variant": "White",
      "price": 12.00,
      "image":
          "https://images.unsplash.com/photo-1603252109612-24fa03d145c8?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "title": "Long Pants",
      "variant": "White",
      "price": 12.00,
      "image":
          "https://images.unsplash.com/photo-1603252109612-24fa03d145c8?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
    {
      "title": "Long Pants",
      "variant": "White",
      "price": 12.00,
      "image":
          "https://images.unsplash.com/photo-1603252109612-24fa03d145c8?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    },
  ];

  List<Map<String, dynamic>> checkedItems = [];
  double totalAmount = 0;
  double _bottomPositionContainer = -230;

  @override
  void initState() {
    super.initState();

    totalAmount = calculateTotal(checkedItems);
  }

  void deletedItem(int index) {
    setState(() {
      data.removeAt(index);
      checkedItems.removeWhere((item) => item['index'] == index);
    });
    Navigator.of(context).pop();
  }

  void toggleChecked(int index, bool? value) {
    setState(() {
      if (value == true) {
        checkedItems.add({...data[index], 'index': index});
      } else {
        checkedItems.removeWhere((item) => item['index'] == index);
      }
      totalAmount = calculateTotal(checkedItems);
    });

    if (checkedItems.length > 0) {
      inPaymentContainer();
    } else {
      outPaymentContainer();
    }
  }

  double calculateTotal(List<Map<String, dynamic>> checkedItems) {
    double totalAmount = 0;

    for (var item in checkedItems) {
      totalAmount += item['price'];
    }

    return totalAmount;
  }

  void inPaymentContainer() {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _bottomPositionContainer = 0; // Ubah posisi container setelah delay
      });
    });
  }

  void outPaymentContainer() {
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _bottomPositionContainer = -230; // Ubah posisi container setelah delay
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CartTile(
                    imgPath: data[index]['image'],
                    name: data[index]['title'],
                    variant: data[index]['variant'],
                    count: 1,
                    price: data[index]['price'],
                    onChangedCheckbox: (value) => toggleChecked(index, value),
                    deletedItem: () => deletedItem(index),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: Colors.black12,
                    ),
                  ),
                  (_bottomPositionContainer == 0 && data.length - 1 == index)
                      ? Container(
                        padding: EdgeInsets.only(top: 10, bottom: 230),
                        child: Text('End of data', style: TextStyle(fontSize: 14, color: fontGrayColor,),),
                      )
                      : Container(),
                ],
              );
            },
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            left: 0,
            right: 0,
            curve: Curves.easeInOutCubic,
            bottom: _bottomPositionContainer,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, -2),
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 5,
                    decoration: BoxDecoration(
                      color: grayColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total amount",
                              style: TextStyle(
                                fontSize: 14,
                                color: fontGrayColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "\$",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "$totalAmount",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DottedDashedLine(
                        height: 0,
                        width: double.infinity,
                        axis: Axis.horizontal,
                        dashColor: fontGrayColor,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(blueColor),
                            foregroundColor:
                                WidgetStatePropertyAll(Colors.white),
                          ),
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
