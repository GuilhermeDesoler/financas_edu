// import 'package:edu_financas/data/main.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthProvider extends ChangeNotifier {
//   final AuthRepository _authRepository;
//   User? user;

//   bool _isLoggedIn = false;
//   bool get isLoggedIn => _isLoggedIn;

//   AuthProvider({AuthRepository? authRepository})
//     : _authRepository = authRepository ?? AuthRepository() {
//     _loadUserFromPrefs();
//     _authRepository.authStateChanges.listen((User? user) async {
//       this.user = user;
//       if (user != null) {
//         _isLoggedIn = true;
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString('auth_token', user.uid);
//       } else {
//         _isLoggedIn = false;
//       }
//       notifyListeners();
//     });
//   }

//   Future<void> _loadUserFromPrefs() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('auth_token');
//     if (token != null) {
//       _isLoggedIn = true;
//     }
//     notifyListeners();
//   }

//   Future<String?> signIn(String email, String password) async {
//     try {
//       await _authRepository.signIn(email: email, password: password);
//       return null;
//     } on FirebaseAuthException catch (e) {
//       return e.message;
//     }
//   }

//   Future<String?> signUp(String email, String password) async {
//     try {
//       await _authRepository.signUp(email: email, password: password);
//       return null;
//     } on FirebaseAuthException catch (e) {
//       return e.message;
//     }
//   }

//   Future<void> signOut() async {
//     _isLoggedIn = false;
//     user = null;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.remove('auth_token');
//     await _authRepository.signOut();
//     notifyListeners();
//   }
// }

import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  String? _error;

  bool get isLoggedIn => _isLoggedIn;
  String? get error => _error;

  Future<void> signIn(String email, String password) async {
    await Future.delayed(Duration(seconds: 4));

    print('email: $email, password: $password');

    if (email == "admin@teste.com" && password == "123456") {
      _isLoggedIn = true;
      _error = null;
    } else {
      _isLoggedIn = false;
      _error = "Usuário ou senha inválidos.";
      throw Error();
    }

    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
