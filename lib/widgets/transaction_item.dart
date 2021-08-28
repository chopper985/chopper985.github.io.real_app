import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';


class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transactions,
    required this.deleteTx,
    required this.index,
  }) : super(key: key);

  final List<Transaction> transactions;
  final Function deleteTx;
  final index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${transactions[index].amount}'),
            ),
          ),
        ),
        title: Text(
          transactions[index].title,
          // ignore: deprecated_member_use
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transactions[index].date),
        ),
        trailing: MediaQuery.of(context).size.width > 393
            // ignore: deprecated_member_use
            ? FlatButton.icon(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () => deleteTx(transactions[index].id),
                label: Text(
                  'Delete',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ))
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(transactions[index].id),
              ),
      ),
    );
  }
}
