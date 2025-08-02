import 'package:edu_financas/application/main.dart';
import 'package:edu_financas/presentation/pages/professor/widgets/user_data_dialog.dart';
import 'package:edu_financas/presentation/widgets/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentsList extends StatelessWidget {
  const StudentsList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorShceme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Consumer<ProfessorPageProvider>(builder: (_, provider, __) {
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
                leading:
                    Icon(Icons.person, size: 18, color: colorShceme.primary),
                title: Text(studentName, style: textTheme.labelLarge),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(width: 1, color: Colors.grey),
                ),
                trailing: IconButton(
                  onPressed: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (_) =>
                          ChangeNotifierProvider<StudentDetailsProvider>(
                        create: (_) => StudentDetailsProvider(
                          userId: studentName,
                        ),
                        builder: (_, __) {
                          return UserDataDialog();
                        },
                      ),
                    );
                  },
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
    });
  }
}
