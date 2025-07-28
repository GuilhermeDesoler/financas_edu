class StudentBalance {
  StudentBalance({
    required this.id,
    required this.studentId,
    required this.balance,
    required this.updatedAt,
  });

  final String id;
  final String studentId;
  final double balance;
  final DateTime updatedAt;
}
