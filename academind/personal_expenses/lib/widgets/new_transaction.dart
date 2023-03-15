import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({super.key, required this.addNewTransaction});

  final Function addNewTransaction;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void newTransaction() {
    final enteredText = titleController.text;

    if (amountController.text.isEmpty) {
      return;
    }

    final enteredAmount = double.parse(amountController.text);

    if (enteredText.isEmpty || enteredAmount <= 0) {
      return;
    }

    addNewTransaction(enteredText, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              textCapitalization: TextCapitalization.words,
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              onSubmitted: (_) => newTransaction(),
            ),
            TextButton(
              onPressed: newTransaction,
              child: const Text('Add Transaction'),
            )
          ],
        ),
      ),
    );
  }
}
