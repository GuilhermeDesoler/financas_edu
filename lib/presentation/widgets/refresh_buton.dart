import 'package:edu_financas/presentation/widgets/buttons/main.dart';
import 'package:flutter/material.dart';

class RefreshButon extends StatelessWidget {
  const RefreshButon({
    required this.loading,
    required this.onPressed,
    super.key,
  });

  final bool loading;
  final dynamic Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      type: ButtonType.outline,
      label: 'Buscar',
      icon: Icons.download_outlined,
      loading: loading,
      onPressed: onPressed,
    );
  }
}
