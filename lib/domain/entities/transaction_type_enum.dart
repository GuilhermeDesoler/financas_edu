enum TransactionType {
  debit('debit', 'Débito'),
  credit('credit', 'Crédito');

  const TransactionType(this.type, this.label);

  final String type;
  final String label;

  TransactionType fromString(String value) {
    return TransactionType.values.firstWhere(
      (e) => e.type == value,
      orElse: () => credit,
    );
  }
}
