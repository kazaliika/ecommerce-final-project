import 'package:ecommerce_final_project/models/transaction.dart';
import 'package:ecommerce_final_project/models/transaction_services.dart';
import 'package:ecommerce_final_project/screens/detail_product_screen.dart';
import 'package:ecommerce_final_project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:provider/provider.dart';

import '../../components/confirm_dialog.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key, required this.tabController});
  final TabController tabController;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // Finish the process, item move to history
  void finishTrasaction(BuildContext context, Transaction data) {
    showDialog(
      context: context,
      builder: (context) {
        return ConfirmDialog(
          title: "you will complete this transaction, are you sure?",
          onCancel: () => Navigator.of(context).pop(),
          onAccept: () {
            context.read<TransactionServices>().movetoHistoryList(data);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final myOrder = context.watch<TransactionServices>().orderList;

    return Padding(
      padding: EdgeInsets.all(25),
      child: Container(
        child: myOrder.length > 0
            ? ListView.builder(
                itemCount: myOrder.length,
                itemBuilder: (context, index) {
                  final data = myOrder[index];
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
                                                  color: blueColor, width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'On Progress',
                                                style: TextStyle(
                                                  color: blueColor,
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
                                onPressed: () =>
                                    finishTrasaction(context, data),
                                child: Text(
                                  "Finish",
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
                    "Your order list is empty, please order some product",
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
