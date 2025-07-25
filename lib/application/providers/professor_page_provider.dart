import 'package:edu_financas/domain/main.dart';
import 'package:flutter/material.dart';

import '../../data/repositories/main.dart';

class ProfessorPageProvider with ChangeNotifier {
  Professor? _professor;
  List<Student>? _students;

  Professor? get professor => _professor;
  List<Student>? get students => _students;

  bool loading = true;

  fetchData() async {
    loading = true;
    _professor = null;
    notifyListeners();

    try {
      _professor = await ProfessorRepository().getProfessorData('');
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

    final prefessorStudents =
        _professor!.students.isEmpty ? 1 : _professor!.students.length;

    return _professor!.spent / prefessorStudents;
  }
}
