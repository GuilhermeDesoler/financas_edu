import 'package:edu_financas/domain/entities/category_enum.dart';
import 'package:edu_financas/domain/entities/transaction_type_enum.dart';

class Transaction {
  Transaction({
    required this.id,
    required this.title,
    required this.value,
    required this.type,
    required this.category,
    required this.description,
    required this.studenId,
    required this.professorId,
    required this.createdAt,
  });

  final String id;
  final String title;
  final double value;
  final TransactionType type;
  final Category category;
  final String description;
  final String studenId;
  final String professorId;
  final DateTime createdAt;
}
