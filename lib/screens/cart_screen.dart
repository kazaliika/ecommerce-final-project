// import 'dart:math';

// import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:ecommerce_final_project/models/item.dart';
import 'package:ecommerce_final_project/models/shop.dart';
import 'package:ecommerce_final_project/screens/payment_screen.dart';
import 'package:ecommerce_final_project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/confirm_dialog.dart';
import '../components/item_cart_tile.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Item> checkedItems = [];
  double totalAmount = 0;
  double _bottomPositionContainer = -230;

  @override
  void initState() {
    super.initState();

    totalAmount = calculateTotal(checkedItems);
  }

  void addItem(Item item) {
    setState(() {
      // checkedItems.add(item);
      context.read<Shop>().addToCart(item);
      totalAmount = calculateTotal(checkedItems);
    });
  }

  void deleteItem(Item item) {
    final quantityItem = context.read<Shop>().userCart[item];
    setState(() {
      if (quantityItem! > 1) {
        context.read<Shop>().removeOneFromCart(item);
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return ConfirmDialog(
              title: "This item will be deleted, are you sure?",
              onCancel: () => Navigator.of(context).pop(),
              onAccept: () {
                context.read<Shop>().removeOneFromCart(item);
                checkedItems.remove(item);
                Navigator.of(context).pop();
                outPaymentContainer();
              },
            );
          },
        );
      }
      totalAmount = calculateTotal(checkedItems);
    });
  }

  void toggleChecked(Item item, bool? value) {
    setState(() {
      if (value == true) {
        checkedItems.add(item);
      } else {
        checkedItems.remove(item);
      }
      totalAmount = calculateTotal(checkedItems);
    });

    if (checkedItems.isNotEmpty) {
      inPaymentContainer();
    } else {
      outPaymentContainer();
    }
  }

  double calculateTotal(List<Item> checkedItems) {
    double totalAmount = 0;
    final itemCart = context.read<Shop>().userCart;

    for (var item in checkedItems) {
      if (itemCart.containsKey(item)) {
        totalAmount += item.price * itemCart[item]!;
      }
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
    final userCart = context.watch<Shop>().userCart;

    print(userCart.length);

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
          userCart.length > 0
              ? ListView.builder(
                  itemCount: userCart.length,
                  itemBuilder: (context, index) {
                    final data = userCart.entries.elementAt(index);
                    final item = data.key;
                    final count = data.value;
                    return Column(
                      children: [
                        CartTile(
                          item: item,
                          count: count,
                          onChangedCheckbox: (value) =>
                              toggleChecked(item, value),
                          removeItem: () => deleteItem(item),
                          addItem: () => addItem(item),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(
                            color: Colors.black12,
                          ),
                        ),
                        (_bottomPositionContainer == 0 &&
                                userCart.length - 1 == index)
                            ? Container(
                                padding: EdgeInsets.only(top: 10, bottom: 230),
                                child: Text(
                                  'End of data',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: fontGrayColor,
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    );
                  },
                )
              : Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    padding: EdgeInsets.only(top: 10, bottom: 230),
                    child: Text(
                      "Your cart is empty, please add some item to your cart.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: fontGrayColor,
                      ),
                    ),
                  ),
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
                                  "${totalAmount.toStringAsFixed(2)}",
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
                      Container(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  Map<Item, int> itemCheckout = {};

                                  for (var item in checkedItems) {
                                    if (userCart.containsKey(item)) {
                                      final dataUserCart = userCart[item];
                                      itemCheckout[item] = dataUserCart!;
                                    }
                                  }

                                  return PaymentScreen(
                                    itemCheckout: itemCheckout,
                                  );
                                },
                              ),
                            );
                          },
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
