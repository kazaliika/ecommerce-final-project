
import 'package:ecommerce_final_project/models/item.dart';

class Transaction {
  final String userName;
  final DateTime datetime;
  final Item item;
  final int quantity;
  final double total;

  Transaction({
    required this.userName,
    required this.datetime,
    required this.item,
    required this.quantity,
    required this.total,
  });
}
