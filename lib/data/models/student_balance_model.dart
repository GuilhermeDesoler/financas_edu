import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_financas/domain/main.dart';

class StudentBalanceModel {
  StudentBalanceModel({
    required this.id,
    required this.studentId,
    required this.balance,
    required this.updatedAt,
  });

  final String id;
  final String studentId;
  final double balance;
  final DateTime updatedAt;

  StudentBalance toEntity() {
    return StudentBalance(
      id: id,
      studentId: studentId,
      balance: balance,
      updatedAt: updatedAt,
    );
  }

  factory StudentBalanceModel.fromEntity(StudentBalance entity) {
    return StudentBalanceModel(
      id: entity.id,
      studentId: entity.studentId,
      balance: entity.balance,
      updatedAt: entity.updatedAt,
    );
  }

  factory StudentBalanceModel.fromJson(DocumentSnapshot doc) {
    final json = doc.data() as Map<String, dynamic>;

    return StudentBalanceModel(
      id: doc.id,
      studentId: json['studentId'],
      balance: (json['balance'] as num).toDouble(),
      updatedAt: (json['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'studentId': studentId,
      'balance': balance,
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}
