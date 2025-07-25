import 'package:dio/dio.dart';
import 'package:edu_financas/data/models/professor_model.dart';
import 'package:edu_financas/domain/main.dart';
import 'package:flutter/material.dart';

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

    final res = await Dio().get(
      'https://finances-edu.free.beeceptor.com/professor',
    );

    final professorRespose = ProfessorModel.fromJson(res.data!).toEntity();

    _professor = professorRespose;
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
