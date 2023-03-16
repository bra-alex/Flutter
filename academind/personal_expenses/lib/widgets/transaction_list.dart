import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, {super.key});

  final List<Transaction> transactions;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: transactions.isEmpty
            ? Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
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
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 8,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                                '\$${transactions[index].amount.toStringAsFixed(2)}'),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      subtitle: Text(
                          DateFormat.yMMMMd().format(transactions[index].date)),
                    ),
                  );
                  Card(
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transactions[index].title,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              DateFormat.yMMMMd()
                                  .format(transactions[index].date),
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount: transactions.length,
              ));
  }
}
