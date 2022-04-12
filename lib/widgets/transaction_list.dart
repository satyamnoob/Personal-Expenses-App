import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Transaction_List extends StatelessWidget {
  final List<Transaction> transactions;

  Transaction_List(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transactions Added Yet",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: Image.asset("assets/images/waiting.png",
                      fit: BoxFit.cover),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: FittedBox(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "₹${transactions[index].amount}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                    ),
                    title: Text(
                      "${transactions[index].title}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                        "${DateFormat.yMMMd().format(transactions[index].date)}"),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
