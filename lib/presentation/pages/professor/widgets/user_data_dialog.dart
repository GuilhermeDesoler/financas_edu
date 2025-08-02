import 'package:edu_financas/application/main.dart';
import 'package:edu_financas/presentation/widgets/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDataDialog extends StatefulWidget {
  const UserDataDialog({super.key});

  @override
  State<UserDataDialog> createState() => _UserDataDialogState();
}

class _UserDataDialogState extends State<UserDataDialog> {
  Future<void> _init() async {
    final provider =
        Provider.of<StudentDetailsProvider>(context, listen: false);
    await provider.fetchData();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Consumer<StudentDetailsProvider>(
      builder: (_, provider, __) {
        return AppModal(
          loading: provider.loading,
          title: 'Dados do Aluno',
          content: !provider.loading && provider.details == null
              ? Text('Aluno não encontrado')
              : Text(
                  'Aluno: ',
                  style: textTheme.headlineSmall,
                ),
          cancelButtonProps: AppModalButtonProps(
            label: 'Fechar',
            type: ButtonType.text,
            onPressed: () => Navigator.of(context).pop(),
          ),
        );
      },
    );
  }
}
