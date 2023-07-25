import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

// A StatefulWidget that represents the 'Add Expense' overlay
class NewExpense extends StatefulWidget {
  const NewExpense({
    Key? key,
    required this.onAddExpense,
  }) : super(key: key);

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

// The State class for the NewExpense widget
class _NewExpenseState extends State<NewExpense> {
  final _amountController = TextEditingController();
  final _titleController = TextEditingController();
  Category _selectedCategory = Category.leisure;
  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  // Method to present the date picker when the date icon is pressed
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  // Method to show the error dialog when there are invalid inputs
  void _showDialog() {
    const content = Text(
      'Please make sure a valid title, amount, date, and category were entered.',
    );

    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Invalid Input'),
          content: content,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Input'),
          content: content,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    }
  }

  // Method to submit the expense data when the 'Save Expense' button is pressed
  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      _showDialog();
      return;
    }

    widget.onAddExpense(
      Expense(
        amount: enteredAmount,
        category: _selectedCategory,
        date: _selectedDate!,
        title: _titleController.text,
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
          child: Column(
            children: [
              _buildTitleAndAmountField(
                  width), // Build the title and amount fields
              const SizedBox(height: 16),
              _buildCategoryAndDatePickerField(
                  width), // Build the category and date picker fields
              const SizedBox(height: 16),
              _buildActionButtons(
                  width), // Build the action buttons (Cancel and Save Expense)
            ],
          ),
        ),
      ),
    );
  }

  // Widget to build the title and amount fields
  Widget _buildTitleAndAmountField(double width) {
    if (width >= 600) {
      // For wider screens, show the fields side by side in a row
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _buildTextField(
              controller: _titleController,
              maxLength: 50,
              keyboardType: TextInputType.name,
              labelText: 'Title',
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: _buildTextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              prefixText: '\$ ',
              labelText: 'Amount',
              maxLength: 1000,
            ),
          ),
        ],
      );
    } else {
      // For smaller screens, show only the title field
      return _buildTextField(
        controller: _titleController,
        maxLength: 50,
        keyboardType: TextInputType.name,
        labelText: 'Title',
      );
    }
  }

  // Widget to build the category and date picker fields
  Widget _buildCategoryAndDatePickerField(double width) {
    if (width >= 600) {
      // For wider screens, show the fields side by side in a row
      return Row(
        children: [
          DropdownButton(
            value: _selectedCategory,
            items: Category.values
                .map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(category.name.toUpperCase()),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value == null) {
                return;
              }
              setState(() {
                _selectedCategory = value;
              });
            },
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _selectedDate == null
                      ? 'No date selected'
                      : formatter.format(_selectedDate!),
                ),
                IconButton(
                  onPressed: _presentDatePicker,
                  icon: const Icon(Icons.calendar_month),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      // For smaller screens, show the category field and date picker below each other
      return Row(
        children: [
          Expanded(
            child: _buildTextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              prefixText: '\$ ',
              labelText: 'Amount',
              maxLength: 1000,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _selectedDate == null
                      ? 'No date selected'
                      : formatter.format(_selectedDate!),
                ),
                IconButton(
                  onPressed: _presentDatePicker,
                  icon: const Icon(Icons.calendar_month),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }

  // Widget to build a text field
  Widget _buildTextField({
    required TextEditingController controller,
    required int maxLength,
    required TextInputType keyboardType,
    String? prefixText,
    required String labelText,
  }) {
    return TextField(
      controller: controller,
      maxLength: maxLength,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixText: prefixText,
        label: Text(labelText),
      ),
    );
  }

  // Widget to build the action buttons (Cancel and Save Expense)
  Widget _buildActionButtons(double width) {
    if (width >= 600) {
      // For wider screens, show the buttons side by side in a row
      return Row(
        children: [
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          const SizedBox(width: 5),
          ElevatedButton(
            onPressed: _submitExpenseData,
            child: const Text('Save Expense'),
          ),
        ],
      );
    } else {
      // For smaller screens, show the buttons below each other
      return Row(
        children: [
          DropdownButton(
            value: _selectedCategory,
            items: Category.values
                .map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(category.name.toUpperCase()),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value == null) {
                return;
              }
              setState(() {
                _selectedCategory = value;
              });
            },
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          const SizedBox(width: 5),
          ElevatedButton(
            onPressed: _submitExpenseData,
            child: const Text('Save Expense'),
          ),
        ],
      );
    }
  }
}
