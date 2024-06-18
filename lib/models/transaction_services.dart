import 'package:ecommerce_final_project/models/item.dart';
import 'package:ecommerce_final_project/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionServices extends ChangeNotifier{
  // list of order
  List<Transaction> _orderList = [];

  // list of history transaction
  List<Transaction> _historyList = [];

  // get list of order
  List<Transaction> get orderList => _orderList;

  // get list of history
  List<Transaction> get historyList => _historyList;

  // add transaction to order
  void addItemtoOrderList(Item product, int qty) {
    
    double total = product.price * qty;
    String name = "Abdul";

    Transaction newTransaction = Transaction(
      userName: name,
      datetime: DateTime.now(),
      item: product,
      quantity: qty,
      total: total,
    );

    _orderList.add(newTransaction);
    notifyListeners();
  }

  // remove transaction to order
  void removeItemFromOrderList(Transaction transaction) {
    _orderList.remove(transaction);
    notifyListeners();

  }

  // add or migration from order to history
  void movetoHistoryList(Transaction transaction) {
    _historyList.add(transaction);

    removeItemFromOrderList(transaction);
    notifyListeners();

  }

  // remove transaction to history
  void removeItemfromHistory(Transaction transaction){
    _historyList.remove(transaction);
    notifyListeners();

  }
}
