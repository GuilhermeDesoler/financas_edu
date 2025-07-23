import 'package:edu_financas/application/main.dart';
import 'package:edu_financas/presentation/main.dart';
import 'package:edu_financas/presentation/pages/professor/main.dart';
import 'package:edu_financas/theme/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider<AppThemeProvider>(
          create: (_) => AppThemeProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(builder: (_, theme, __) {
      theme.getTheme();

      return MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.appTheme(theme.isDarkMode),
        home: _routes(),
      );
    });
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
