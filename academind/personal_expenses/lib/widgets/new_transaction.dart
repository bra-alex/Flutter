import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/adaptive_button.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({super.key, required this.addNewTransaction});

  final Function addNewTransaction;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _newTransaction() {
    final enteredText = _titleController.text;

    if (_amountController.text.isEmpty) {
      return;
    }

    final enteredAmount = double.parse(_amountController.text);

    if (enteredText.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addNewTransaction(enteredText, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    Platform.isIOS
        ? showCupertinoModalPopup(
            context: context,
            builder: (_) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.35,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return SizedBox(
                          height: constraints.minHeight + 200,
                          child: CupertinoDatePicker(
                            minimumDate: DateTime(2023),
                            maximumDate: DateTime.now(),
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (pickedDate) {
                              setState(() {
                                _selectedDate = pickedDate;
                              });
                            },
                          ),
                        );
                      },
                    ),
                    CupertinoButton(
                      child: const Text('OK'),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  ],
                ),
              );
            },
          )
        : showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now(),
          ).then((pickedDate) {
            if (pickedDate == null) {
              return;
            }
            setState(() {
              _selectedDate = pickedDate;
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                textCapitalization: TextCapitalization.words,
                controller: _titleController,
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Amount',
                ),
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onSubmitted: (_) => _newTransaction(),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate != null
                            ? 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}'
                            : 'No Date Chosen!',
                      ),
                    ),
                    AdaptiveButton(
                      text: 'Choose Date',
                      onPressed: _presentDatePicker,
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _newTransaction,
                child: const Text('Add Transaction'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
