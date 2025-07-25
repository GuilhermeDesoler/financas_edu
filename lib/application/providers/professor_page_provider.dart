import 'package:edu_financas/domain/main.dart';
import 'package:flutter/material.dart';

class ProfessorPageProvider with ChangeNotifier {
  Professor? _professor;
  List<Student>? _students;

  Professor? get professor => _professor;
  List<Student>? get students => _students;

  bool get loading => _professor == null || _students == null;

  fetchData() async {
    print('step 2');
    final professorRespose = await Future.delayed(
      const Duration(seconds: 2),
      () => Professor(
        id: '12345',
        name: 'Chawee',
        email: 'have-sex-with@me.com',
        role: Roles.professor,
        students: ['Chawee', 'Max', 'NewBaby', 'Sarah', 'Guilherme'],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
    final studentsResponse = await Future.delayed(const Duration(seconds: 3));

    _professor = professorRespose;
    _students = studentsResponse;
    print('step 3');
    notifyListeners();
  }
}
