import 'package:flutter/material.dart';

class WarningCard extends StatelessWidget {
  const WarningCard({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.amber),
        borderRadius: BorderRadius.circular(8),
        color: Colors.amberAccent,
      ),
      child: Row(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.warning, size: 24, color: Colors.black),
          Expanded(
            child: Text(
              message,
              style: textTheme.labelLarge?.copyWith(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
