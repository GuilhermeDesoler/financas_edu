import 'package:edu_financas/domain/entities/roles_enum.dart';

class Professor {
  Professor({
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
  final Roles role;
  final DateTime createdAt;
  final DateTime updatedAt;
}
