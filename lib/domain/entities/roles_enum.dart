enum Roles {
  student('student', 'Aluno'),
  professor('professor', 'Professor');

  const Roles(this.role, this.label);

  final String role;
  final String label;

  static Roles fromString(String role) {
    return Roles.values.firstWhere(
      (e) => e.role == role,
      orElse: () => Roles.student,
    );
  }
}
