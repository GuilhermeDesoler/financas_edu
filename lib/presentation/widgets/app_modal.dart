import 'package:edu_financas/presentation/widgets/buttons/main.dart';
import 'package:flutter/material.dart';

class AppModal extends StatelessWidget {
  const AppModal({
    required this.title,
    required this.content,
    this.loading = false,
    this.cancelButtonProps,
    this.confirmButtonProps,
    super.key,
  });

  final String title;
  final Widget content;
  final bool loading;
  final AppModalButtonProps? cancelButtonProps;
  final AppModalButtonProps? confirmButtonProps;

  @override
  Widget build(BuildContext context) {
    final hasFooter = cancelButtonProps != null || confirmButtonProps != null;

    return Center(
      child: loading
          ? SizedBox.square(
              dimension: 54,
              child: CircularProgressIndicator.adaptive(),
            )
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 480),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.amber),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        const Divider(),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                16, 12, 16, hasFooter ? 12 : 24),
                            child: content,
                          ),
                        ),
                        if (hasFooter) const Divider(),
                        if (hasFooter)
                          Padding(
                            padding: EdgeInsets.fromLTRB(16, 12, 16, 24),
                            child: _bottomButtons(),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _bottomButtons() {
    return Row(
      spacing: 12,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (cancelButtonProps != null)
          AppButton(
            label: cancelButtonProps!.label,
            loading: cancelButtonProps!.loading,
            disabled: cancelButtonProps!.disabled,
            type: cancelButtonProps!.type,
            icon: cancelButtonProps!.icon,
            onPressed: cancelButtonProps!.onPressed,
          ),
        if (confirmButtonProps != null)
          AppButton(
            label: confirmButtonProps!.label,
            loading: confirmButtonProps!.loading,
            disabled: confirmButtonProps!.disabled,
            type: confirmButtonProps!.type,
            icon: confirmButtonProps!.icon,
            onPressed: confirmButtonProps!.onPressed,
          ),
      ],
    );
  }
}

class AppModalButtonProps {
  AppModalButtonProps({
    required this.label,
    required this.onPressed,
    this.loading = false,
    this.disabled = false,
    this.type = ButtonType.filled,
    this.icon,
  });

  final String label;
  final dynamic Function() onPressed;
  final bool loading;
  final bool disabled;
  final ButtonType type;
  final IconData? icon;
}
