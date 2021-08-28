import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constrains) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: constrains.maxHeight * 0.7,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(
                transactions: transactions,
                deleteTx: deleteTx,
                index: index,
              );
            },
            itemCount: transactions.length,
          );
  }
}

