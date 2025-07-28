import 'package:edu_financas/application/main.dart';
import 'package:edu_financas/presentation/widgets/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    _emailController.text = "admin@teste.com";
    _passwordController.text = "123456";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        Text('Olá! Bem-vindo ao app escolar.', style: textTheme.titleLarge),
        Text(
          'Por favor, faça login para continuar.',
          style: textTheme.bodyLarge,
        ),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(labelText: 'Senha'),
        ),
        Consumer<AuthProvider>(
          builder: (_, auth, __) {
            return SizedBox(
              width: double.infinity,
              child: AppButton(
                label: 'Entrar',
                icon: Icons.login,
                disabled:
                    _emailController.text.isEmpty ||
                    _passwordController.text.isEmpty,
                onPressed: () async => await auth.signIn(
                  _emailController.text,
                  _passwordController.text,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
