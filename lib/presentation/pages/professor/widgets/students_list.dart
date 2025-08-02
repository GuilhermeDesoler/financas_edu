import 'package:edu_financas/application/providers/professor_page_provider.dart';
import 'package:edu_financas/presentation/widgets/main.dart';
import 'package:flutter/material.dart';

class StudentsList extends StatelessWidget {
  const StudentsList({required this.provider, super.key});

  final ProfessorPageProvider provider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorShceme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final students = provider.filteredStudents;

    return InfoCard(
      label: 'Lista de alunos',
      content: Column(
        spacing: 12,
        children: [
          TextFormField(
            enabled: !provider.loading,
            decoration: InputDecoration(
              hintText: 'Buscar',
              suffixIcon: Icon(Icons.search),
            ),
            initialValue: provider.search,
            onChanged: (v) => provider.onSearch(v),
          ),
          ...students.map((studentName) {
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
          }),
        ],
      ),
      topButton: InfoCardButtonProps(
        icon: Icons.add,
        onPressed: () => print('Add Student'),
      ),
    );
  }
}
