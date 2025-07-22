import 'package:edu_financas/application/main.dart';
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

  bool _loading = false;

  @override
  void initState() {
    _emailController.text = "admin@teste.com";
    _passwordController.text = "123456";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        Text('Olá! Bem-vindo ao app escolar.'),
        Text('Por favor, faça login para continuar.'),
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
              child: FilledButton.icon(
                icon: SizedBox.square(
                  dimension: 20,
                  child: _loading
                      ? CircularProgressIndicator()
                      : Icon(Icons.login),
                ),
                onPressed: _loading
                    ? null
                    : () async {
                        setState(() {
                          _loading = true;
                        });
                        try {
                          await auth.signIn(
                            _emailController.text,
                            _passwordController.text,
                          );
                        } catch (_) {
                          if (context.mounted) {
                            setState(() {
                              _loading = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Email ou senha inválidos'),
                              ),
                            );
                          }
                        }
                      },
                label: Text('Entrar'),
              ),
            );
          },
        ),
      ],
    );
  }
}
