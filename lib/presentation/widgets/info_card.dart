import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    required this.label,
    required this.content,
    this.topButton,
    super.key,
  });

  final String label;
  final Widget content;
  final InfoCardButtonProps? topButton;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
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
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 60),
            child: Row(
              spacing: 8,
              children: [
                Expanded(child: Text(label, style: textTheme.titleMedium)),
                if (topButton != null)
                  IconButton(
                    onPressed: topButton!.onPressed,
                    icon: Icon(topButton!.icon, color: colorScheme.onSurface),
                  ),
              ],
            ),
          ),
          content,
        ],
      ),
    );
  }
}

class InfoCardButtonProps {
  InfoCardButtonProps({required this.icon, required this.onPressed});

  final IconData icon;
  final void Function() onPressed;
}
