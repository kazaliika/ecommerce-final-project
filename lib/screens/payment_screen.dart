import 'package:ecommerce_final_project/components/bottom_navigation.dart';
import 'package:ecommerce_final_project/models/shop.dart';
import 'package:ecommerce_final_project/models/transaction_services.dart';
import 'package:ecommerce_final_project/screens/address_screen.dart';
import 'package:ecommerce_final_project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.itemCheckout});

  final Map<Item, int> itemCheckout;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  double _bottomPositionContainer = -500;
  double totalAmount = 0;

  @override
  void initState() {
    super.initState();

    totalAmount = calculateTotal(widget.itemCheckout);
  }

  double calculateTotal(Map<Item, int> items) {
    for (int i = 0; i < items.length; i++) {
      final data = items.entries.elementAt(i);
      final item = data.key;
      final qty = data.value;

      totalAmount += item.price * qty;
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
        _bottomPositionContainer = -500; // Ubah posisi container setelah delay
      });
    });
  }

  void checkoutItem(BuildContext context, Map<Item, int> items) {
    for (int i = 0; i < items.length; i++) {
      final data = items.entries.elementAt(i);
      final item = data.key;
      final qty = data.value;

      context.read<Shop>().removeFromCart(item);
      context.read<TransactionServices>().addItemtoOrderList(item, qty);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 100,
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
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            "Payment",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Address
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Address",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return AddressScreen();
                              },
                            ),
                          );
                        },
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          foregroundColor: WidgetStatePropertyAll(blueColor),
                        ),
                        child: Text("Edit"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 100,
                        child: AspectRatio(
                          aspectRatio: 3 / 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "House",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "5482, adobe Falls Rd #155an Diego, California(CA), 92120",
                                style: TextStyle(
                                    fontSize: 12, color: fontGrayColor),
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

                  // Product
                  Text(
                    "Products (${widget.itemCheckout.length})",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.itemCheckout.length,
                    itemBuilder: (context, index) {
                      final data = widget.itemCheckout.entries.elementAt(index);
                      final item = data.key;
                      final qty = data.value;

                      return Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            // Image Product
                            Container(
                              height: 80,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "${item.image}",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),

                            // Information of Product
                            Expanded(
                              child: Container(
                                height: 80,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    // name of product
                                    Text(
                                      "${item.title}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    // brand & price
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "\$ ",
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              "${item.price}",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              " x $qty",
                                              style: TextStyle(
                                                fontSize: 16,
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
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
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
                        checkoutItem(context, widget.itemCheckout);
                        int orderListLenght = Provider.of<TransactionServices>(
                                context,
                                listen: false)
                            .orderList
                            .length;
                        print("order list: ${orderListLenght}");

                        inPaymentContainer();
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(blueColor),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
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
              height: 500,
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
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/order_success.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Text(
                        "Order Successfully",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Your order will be packed by the Kutubu, will arrive at your house in 3 to 4 days",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: fontGrayColor,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            outPaymentContainer();

                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) {
                                  return BottomNavigation(
                                    index: 1,
                                  );
                                },
                              ),
                              (route) => false,
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(blueColor),
                            foregroundColor:
                                WidgetStatePropertyAll(Colors.white),
                          ),
                          child: Text(
                            "Order Tracking",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
