import 'package:edu_financas/application/main.dart';
import 'package:edu_financas/presentation/main.dart';
import 'package:edu_financas/presentation/pages/professor/main.dart';
import 'package:edu_financas/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      home: _routes(),
    );
  }

  Widget _routes() {
    return Consumer<AuthProvider>(
      builder: (_, auth, __) {
        if (auth.isLoggedIn) {
          return ProfessorPage();
        }

        return const LoginPage();
      },
    );
  }
}
