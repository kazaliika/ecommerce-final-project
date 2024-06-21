import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(tabs: [
                Tab(
                  text: 'My Order',
                ),
                Tab(
                  text: 'History',
                )
              ]),
              title: const Text('My Order List'),
            ),
            body: TabBarView(
              children: [
                ListView(
                  children: const [
                    OrderItem(
                      imagePath: 'assets/tas_kantor.jpg',
                      title: 'Big Bag Limited Edition 229',
                      color: 'Black',
                      quantity: 1,
                      price: 24.00,
                      status: 'On Progress',
                    ),
                    OrderItem(
                      imagePath: 'assets/tas_ransel.jpg',
                      title: 'Big Bag 319',
                      color: 'Blach',
                      quantity: 1,
                      price: 21.50,
                      status: 'On Progress',
                    ),
                  ],
                ),
                ListView(
                  children: const [
                    OrderItem(
                      imagePath: 'assets/headphone_coklat.jpg',
                      title: 'Box Headphone 132',
                      color: 'Brown',
                      quantity: 1,
                      price: 26.00,
                      status: 'Completed',
                    ),
                    OrderItem(
                      imagePath: 'assets/headphone_putih.png',
                      title: 'Box Headphone 345',
                      color: 'White',
                      quantity: 1,
                      price: 27.30,
                      status: 'Completed',
                    ),
                  ],
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_shipping),
                  label: 'My Order',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outline),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined),
                  label: 'Profile',
                ),
              ],
              currentIndex: 1,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              onTap: (value) {},
            ),
          ),
        ));
  }
}

class OrderItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String color;
  final int quantity;
  final double price;
  final String status;

  const OrderItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.color,
    required this.quantity,
    required this.price,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(imagePath, width: 50, height: 50),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            title,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text('Color: $color'),
                        Text('Qty: $quantity'),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: status == 'Completed'
                              ? Colors.green
                              : Colors.blue,
                        ),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: status == 'Completed'
                              ? Colors.green
                              : Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$$price',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Handle Detail button press
                    },
                    child: const Text('Detail'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Handle Tracking button press
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: Text(
                      status == 'Completed' ? 'Received Order' : 'Tracking',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
