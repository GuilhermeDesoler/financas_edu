import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({required this.label, required this.content, super.key});

  final String label;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colorScheme.outline),
        color: colorScheme.surfaceContainerHighest,
      ),
      child: Column(
        spacing: 4,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
          content,
        ],
      ),
    );
  }
}
