import 'package:ecommerce_final_project/models/shop.dart';
import 'package:ecommerce_final_project/screens/detail_product_screen.dart';
import 'package:ecommerce_final_project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:provider/provider.dart';

import '../../components/confirm_dialog.dart';
import '../../models/item.dart';
import '../../models/transaction_services.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key, required this.tabController});
  final TabController tabController;

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  // buy again. add to cart
  void addtoCart(BuildContext context, Item item) {
    showDialog(
      context: context,
      builder: (context) {
        return ConfirmDialog(
          title: "This item will be in your cart, are you sure?",
          onCancel: () => Navigator.of(context).pop(),
          onAccept: () {
            context.read<Shop>().addToCart(item);
            Navigator.of(context).pop();
            // print the length of the cart after adding the item
            print(context.read<Shop>().userCart.length);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final histories = context.watch<TransactionServices>().historyList;

    return Padding(
      padding: EdgeInsets.all(25),
      child: Container(
        child: histories.length > 0
            ? ListView.builder(
                itemCount: histories.length,
                itemBuilder: (context, index) {
                  final data = histories[index];
                  return Container(
                    height: 200,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: grayColor, width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        // Information product
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "${data.item.image}",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),

                            // Information Product
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            "${data.item.title}",
                                            maxLines: 3,
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            width: 50,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.green.shade500,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Completed',
                                                style: TextStyle(
                                                  color: Colors.green.shade500,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Qty: ",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: fontGrayColor,
                                              ),
                                            ),
                                            Text(
                                              "${data.quantity}",
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "\$ ",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: fontGrayColor,
                                              ),
                                            ),
                                            Text(
                                              "${data.item.price}",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        // Buttons
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.white),
                                  foregroundColor:
                                      WidgetStatePropertyAll(Colors.black),
                                  overlayColor:
                                      WidgetStatePropertyAll(Colors.black12),
                                  padding: WidgetStatePropertyAll(
                                    EdgeInsets.symmetric(vertical: 5),
                                  ),
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                          color: grayColor, width: 1),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  pushScreen(
                                    context,
                                    screen:
                                        DetailProductScreen(item: data.item),
                                  );
                                },
                                child: Text(
                                  "Detail",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(blueColor),
                                  foregroundColor:
                                      WidgetStatePropertyAll(Colors.white),
                                  overlayColor:
                                      WidgetStatePropertyAll(Colors.white30),
                                  padding: WidgetStatePropertyAll(
                                    EdgeInsets.symmetric(vertical: 5),
                                  ),
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                onPressed: () => addtoCart(context, data.item),
                                child: Text(
                                  "Buy again",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              )
            : Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  padding: EdgeInsets.only(top: 10, bottom: 230),
                  child: Text(
                    "Your history is empty, please buy something.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: fontGrayColor,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
