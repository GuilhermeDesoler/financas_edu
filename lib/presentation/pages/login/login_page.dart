import 'package:edu_financas/application/main.dart';
import 'package:edu_financas/presentation/pages/login/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final device = ResponsiveService(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: device.isPhone ? _mobile() : _desktop(),
        ),
      ),
    );
  }

  Widget _desktop() {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: Row(
          spacing: 24,
          children: [
            Expanded(child: Container(height: 240, color: Colors.red)),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: LoginForm(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mobile() {
    return SingleChildScrollView(
      child: Column(
        spacing: 24,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(height: 240, width: 300, color: Colors.red),
          LoginForm(),
        ],
      ),
    );
  }
}
