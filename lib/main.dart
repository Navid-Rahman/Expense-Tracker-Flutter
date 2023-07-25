// Importing necessary libraries
import 'package:flutter/material.dart';

// Importing the 'Expenses' widget
import 'package:expense_tracker/widgets/expenses.dart';

// Defining a custom color scheme for the light theme
var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

// Defining a custom color scheme for the dark theme
var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125));

// Main function where the app starts
void main() {
  // Running the app within a 'SafeArea' widget to ensure content avoids system UI elements
  runApp(
    SafeArea(
      // Creating the 'MaterialApp' which represents the root of the Flutter app
      child: MaterialApp(
        // Configuring the dark theme for the app
        darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: kDarkColorScheme,
          cardTheme: const CardTheme().copyWith(
            color: kDarkColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
              foregroundColor: kDarkColorScheme.onPrimaryContainer,
            ),
          ),
        ),

        // Configuring the light theme for the app
        theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
            ),
          ),
          textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kColorScheme.onSecondaryContainer,
                  fontSize: 16,
                ),
              ),
        ),

        // Setting the theme mode to 'ThemeMode.system' to use the system-defined theme (light/dark)
        themeMode: ThemeMode.system,

        // Disabling the debug banner on top of the app
        debugShowCheckedModeBanner: false,

        // Setting the home screen of the app to the 'Expenses' widget
        home: const Expenses(),
      ),
    ),
  );
}
