import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.disabled = false,
    this.icon,
    this.type = ButtonType.filled,
    super.key,
  });

  final String label;
  final dynamic Function() onPressed;
  final bool loading;
  final bool disabled;
  final IconData? icon;
  final ButtonType type;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _loading = false;

  Future<void> _execute() async {
    setState(() {
      _loading = true;
    });
    await widget.onPressed();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loading = widget.loading || _loading;
    final disabled = widget.disabled || loading;

    switch (widget.type) {
      case ButtonType.text:
        return TextButton.icon(
          onPressed: disabled ? null : _execute,
          label: Text(widget.label),
          icon: SizedBox.square(
            dimension: 20,
            child: loading ? CircularProgressIndicator() : Icon(widget.icon),
          ),
        );
      case ButtonType.outline:
        return OutlinedButton.icon(
          onPressed: disabled ? null : _execute,
          label: Text(widget.label),
          icon: SizedBox.square(
            dimension: 20,
            child: loading ? CircularProgressIndicator() : Icon(widget.icon),
          ),
        );
      default:
        return FilledButton.icon(
          onPressed: disabled ? null : _execute,
          label: Text(widget.label),
          icon: SizedBox.square(
            dimension: 20,
            child: loading ? CircularProgressIndicator() : Icon(widget.icon),
          ),
        );
    }
  }
}

enum ButtonType { filled, text, outline }
