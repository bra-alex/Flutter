import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(
    this.transactions, {
    super.key,
    required this.deleteTransaction,
  });

  final Function deleteTransaction;
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(
                transaction: transactions[index],
                deleteTransaction: deleteTransaction,
              );
            },
            itemCount: transactions.length,
          );
  }
}
