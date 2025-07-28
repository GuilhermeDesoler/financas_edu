import 'package:edu_financas/application/providers/professor_page_provider.dart';
import 'package:edu_financas/presentation/widgets/main.dart';
import 'package:flutter/material.dart';

class StudentsList extends StatefulWidget {
  const StudentsList({required this.provider, super.key});

  final ProfessorPageProvider provider;

  @override
  State<StudentsList> createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsList> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorShceme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final students = widget.provider.professor?.students ?? [];

    return InfoCard(
      label: 'Lista de alunos',
      content: Column(
        spacing: 12,
        children: students.map((studentName) {
          return ListTile(
            leading: Icon(Icons.person, size: 18, color: colorShceme.primary),
            title: Text(studentName, style: textTheme.labelLarge),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(width: 1, color: Colors.grey),
            ),
            trailing: IconButton(
              onPressed: () => print('Clicked'),
              icon: Icon(Icons.visibility),
            ),
          );
        }).toList(),
      ),
      topButton: InfoCardButtonProps(
        icon: Icons.add,
        onPressed: () => print('Add Student'),
      ),
    );
  }
}
