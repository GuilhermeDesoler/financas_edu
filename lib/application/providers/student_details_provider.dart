import 'package:edu_financas/domain/main.dart';
import 'package:flutter/material.dart';

class StudentDetailsProvider with ChangeNotifier {
  StudentDetailsProvider({
    required this.userId,
  });

  final String userId;

  Student? _studentDetails;

  Student? get details => _studentDetails;

  bool loading = true;

  Future<void> fetchData() async {
    loading = true;
    notifyListeners();

    try {
      // Simulate a network call to fetch user details
      await Future.delayed(
        const Duration(seconds: 2),
        () => Student(
          id: '123456',
          name: 'Guilherme Lima Desoler',
          email: 'guilherme.desoler@gmail.com',
          age: 32,
          grade: 5,
          group: 'A',
          professorId: '123456789',
          role: Roles.student,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
    } catch (e) {
      // Handle any errors that occur during the fetch
      debugPrint('Error fetching user details: $e');
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
