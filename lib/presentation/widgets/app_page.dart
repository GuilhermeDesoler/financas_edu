import 'package:edu_financas/application/main.dart';
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
      appBar: _appBar(),
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

  AppBar _appBar() {
    return AppBar(
      title: Text('Poupança Virtual'),
      leading: Icon(Icons.attach_money_outlined, size: 24, color: Colors.white),
      actions: [
        Consumer<AuthProvider>(builder: (_, auth, __) {
          return IconButton(
            onPressed: auth.logout,
            icon: Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
          );
        })
      ],
    );
  }
}
