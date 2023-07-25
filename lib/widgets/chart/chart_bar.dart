// Importing required libraries
import 'package:flutter/material.dart';

// A StatelessWidget that represents a bar in the chart
class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.fill,
  });

  final double fill;

  @override
  Widget build(BuildContext context) {
    // Checking if the current platform brightness is dark mode
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    // Building the chart bar as an Expanded widget with padding and FractionallySizedBox
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          // Using FractionallySizedBox to fill the height based on the fill value (0 to 1)
          heightFactor: fill,

          // A DecoratedBox to apply a BoxDecoration to the chart bar
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),

              // Setting the color of the chart bar based on the theme
              color: isDarkMode
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary.withOpacity(0.65),
            ),
          ),
        ),
      ),
    );
  }
}
