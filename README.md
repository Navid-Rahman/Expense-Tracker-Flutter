# Expense Tracker App

## Overview

The Expense Tracker App is a simple Flutter application that allows users to track their expenses and categorize them into different categories such as food, travel, leisure, and work. It provides an intuitive user interface to add, view, and manage expenses, helping users keep a track of their spending.

## Features

- Add new expenses with details like title, amount, date, and category.
- Categorize expenses into predefined categories (food, travel, leisure, work).
- View a summary of expenses in a chart, showing the total expenses for each category.
- Swipe to delete expenses from the list.
- Automatically switch between light and dark themes based on the device's system settings.

## Screenshots

- Screenshot 1
  ![Screenshot_1690268813](https://github.com/Navid-Rahman/Expense-Tracker-Flutter/assets/77515075/82d2b152-5da7-4eac-bbc1-ad40d18a7a6c)

- Screenshot 2
  ![Screenshot_1690268866](https://github.com/Navid-Rahman/Expense-Tracker-Flutter/assets/77515075/450c235f-d619-4f4a-826c-a05a57b1e2d2)

- Screenshot 3
  ![Screenshot_1690268870](https://github.com/Navid-Rahman/Expense-Tracker-Flutter/assets/77515075/8dca7457-0465-477d-8171-24c11a12d146)

## Installation

1. Make sure you have Flutter SDK installed on your system.
2. Clone the repository: git clone '[https://github.com/username/expense_tracker.git](https://github.com/Navid-Rahman/Expense-Tracker-Flutter.git)'
3. Navigate to the project directory: **'cd expense_tracker'**
4. Install dependencies: **'flutter pub get'**
5. Run the app: **'flutter run'**

## Usage

The Expense Tracker app offers a user-friendly interface to add and manage expenses.

- **Adding an Expense:** Tap on the '+' icon in the top-right corner to add a new expense. Fill in the required details such as title, amount, date, and select a category from the dropdown.

- **Viewing Expenses:** The main screen displays a list of registered expenses. Expenses are grouped by categories, and you can view the total expenses for each category in the chart at the top.

- **Deleting an Expense:** Swipe an expense item left or right to reveal a delete icon. Tap the delete icon to remove the expense from the list.

## Customization

You can customize the app's theme by modifying the color schemes defined in the main.dart file. The kColorScheme and kDarkColorScheme variables define the color schemes for the light and dark themes, respectively.

Copy code

```dart
var kColorScheme =
ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

var kDarkColorScheme = ColorScheme.fromSeed(
brightness: Brightness.dark,
seedColor: const Color.fromARGB(255, 5, 99, 125));
```

## Dependencies

The Expense Tracker app uses the following external dependencies:

- **flutter/material.dart:** The core Flutter framework for building UI.
- **intl:** For date formatting.
- **uuid:** For generating unique IDs for expenses.

Enjoy tracking your expenses with the Expense Tracker App! 📊💸
