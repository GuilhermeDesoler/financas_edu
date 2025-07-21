import 'package:edu_financas/domain/entities/main.dart';

class Student {
  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
    required this.grade,
    required this.group,
    required this.professorId,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String name;
  final String email;
  final int age;
  final int grade;
  final String group;
  final String professorId;
  final Roles role;
  final DateTime createdAt;
  final DateTime updatedAt;
}
