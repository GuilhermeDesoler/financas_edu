import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_financas/domain/entities/professor.dart';
import 'package:edu_financas/domain/entities/roles_enum.dart';

class ProfessorModel {
  ProfessorModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String name;
  final String email;
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;

  Professor toEntity() {
    return Professor(
      id: id,
      name: name,
      email: email,
      role: Roles.fromString(role),
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
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  factory ProfessorModel.fromJson(DocumentSnapshot doc) {
    final json = doc.data() as Map<String, dynamic>;

    return ProfessorModel(
      id: doc.id,
      name: json['name'],
      email: json['email'],
      role: json['role'],
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      updatedAt: (json['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'role': role,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}
