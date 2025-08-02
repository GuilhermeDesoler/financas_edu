import 'package:edu_financas/domain/main.dart';
import 'package:flutter/material.dart';

import '../../data/repositories/main.dart';

class ProfessorPageProvider with ChangeNotifier {
  Professor? _professor;
  List<Student>? _students;

  Professor? get professor => _professor;
  List<Student>? get students => _students;

  bool loading = true;
  String? search;

  void onSearch(String? value) {
    search = value;
    notifyListeners();
  }

  List<String> get filteredStudents {
    if (professor == null) {
      return [];
    }

    if (search == null || search!.isEmpty) {
      return professor!.students;
    }

    return professor!.students
        .where(
          (student) => student.toLowerCase().contains(search!.toLowerCase()),
        )
        .toList();
  }

  fetchData() async {
    loading = true;
    _professor = null;
    notifyListeners();

    try {
      final res = await ProfessorRepository().getProfessorData('');
      _professor = res;
      _students = res.students
          .map(
            (it) => Student(
              id: it,
              name: it,
              email: it,
              age: 0,
              grade: 5,
              group: 'A',
              professorId: res.id,
              role: Roles.student,
              createdAt: DateTime.now(),
              updatedAt: DateTime.now(),
            ),
          )
          .toList();
    } on Exception catch (e) {
      debugPrint('Error getting professor data: $e');
    }

    loading = false;
    notifyListeners();
  }

  double? get average {
    if (_professor == null) {
      return null;
    }

    final prefessorStudents = _professor!.students.isEmpty
        ? 1
        : _professor!.students.length;

    return _professor!.spent / prefessorStudents;
  }
}
