import 'package:edu_financas/application/main.dart';
import 'package:edu_financas/theme/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppPage extends StatelessWidget {
  const AppPage({
    required this.body,
    super.key,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                body,
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return AppBar(
      backgroundColor: colorScheme.primaryContainer,
      title: Text(
        'Poupança Virtual',
        style: textTheme.titleMedium,
      ),
      titleTextStyle: TextStyle(color: colorScheme.onPrimary),
      titleSpacing: 4,
      leading: Icon(
        Icons.attach_money_outlined,
        size: 28,
        color: colorScheme.onSurface,
      ),
      actionsPadding: const EdgeInsets.only(right: 16),
      actions: [
        Consumer<AppThemeProvider>(builder: (_, theme, __) {
          return IconButton(
            onPressed: theme.toggleTheme,
            icon: theme.isDarkMode
                ? Icon(Icons.nightlight_outlined)
                : Icon(Icons.wb_sunny_outlined),
          );
        }),
        const SizedBox(width: 16),
        Consumer<AuthProvider>(builder: (_, auth, __) {
          return IconButton(
            onPressed: auth.logout,
            icon: Icon(Icons.logout_outlined),
          );
        })
      ],
    );
  }
}
