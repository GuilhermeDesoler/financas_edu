import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_financas/domain/entities/professor.dart';
import 'package:edu_financas/domain/entities/roles_enum.dart';

class ProfessorModel {
  ProfessorModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.students,
    required this.spent,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String name;
  final String email;
  final String role;
  final List<String> students;
  final double spent;
  final DateTime createdAt;
  final DateTime updatedAt;

  Professor toEntity() {
    return Professor(
      id: id,
      name: name,
      email: email,
      role: Roles.fromString(role),
      students: students,
      spent: spent,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory ProfessorModel.fromEntity(Professor entity) {
    return ProfessorModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      role: entity.role.name,
      students: entity.students,
      spent: entity.spent,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  // factory ProfessorModel.fromJson(DocumentSnapshot doc) {
  //   final json = doc.data() as Map<String, dynamic>;

  //   return ProfessorModel(
  //     id: doc.id,
  //     name: json['name'],
  //     email: json['email'],
  //     role: json['role'],
  //     students: List.from(json['students']),
  //     createdAt: (json['createdAt'] as Timestamp).toDate(),
  //     updatedAt: (json['updatedAt'] as Timestamp).toDate(),
  //   );
  // }

  factory ProfessorModel.fromJson(Map<String, dynamic> json) {
    return ProfessorModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      students: List.from(json['students']),
      spent: json['spent'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'role': role,
      'students': students,
      'spent': spent,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}
