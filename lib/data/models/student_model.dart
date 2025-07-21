import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_financas/domain/main.dart';

class StudentModel {
  StudentModel({
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
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;

  Student toEntity() {
    return Student(
      id: id,
      name: name,
      email: email,
      age: age,
      grade: grade,
      group: group,
      professorId: professorId,
      role: Roles.fromString(role),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory StudentModel.fromEntity(Student entity) {
    return StudentModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      age: entity.age,
      grade: entity.grade,
      group: entity.group,
      professorId: entity.professorId,
      role: entity.role.name,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  factory StudentModel.fromJson(DocumentSnapshot doc) {
    final json = doc.data() as Map<String, dynamic>;

    return StudentModel(
      id: doc.id,
      name: json['name'],
      email: json['email'],
      age: json['age'],
      grade: json['grade'],
      group: json['group'],
      professorId: json['professorId'],
      role: json['role'],
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      updatedAt: (json['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'age': age,
      'grade': grade,
      'group': group,
      'professorId': professorId,
      'role': role,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}
