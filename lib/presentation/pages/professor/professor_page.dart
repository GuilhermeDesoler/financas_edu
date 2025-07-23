import 'package:edu_financas/application/main.dart';
import 'package:edu_financas/domain/main.dart';
import 'package:edu_financas/presentation/widgets/main.dart';
import 'package:flutter/material.dart';

class ProfessorPage extends StatelessWidget {
  const ProfessorPage({super.key});

  List<String> get students => ['Chawee', 'Max', 'Sarah', 'Guilherme'];

  @override
  Widget build(BuildContext context) {
    final device = ResponsiveService(context);

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AppPage(
      body: Column(
        spacing: 16,
        children: [
          Row(children: [Expanded(child: _warningMessage())]),
          SectionCard(
            label: 'Painel do professor',
            content: device.isPhone
                ? _mobileLayout(colorScheme)
                : _desktopLayout(colorScheme),
          ),
        ],
      ),
    );
  }

  Widget _desktopLayout(ColorScheme colorScheme) {
    return Column(
      spacing: 16,
      children: [
        Row(
          spacing: 16,
          children: [
            Expanded(child: _studentCard(colorScheme)),
            Expanded(child: _usedTotal(colorScheme)),
            Expanded(child: _studentAverage(colorScheme)),
          ],
        ),
        Row(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _studentList()),
            Expanded(child: _registerStudentForm()),
          ],
        ),
      ],
    );
  }

  Widget _mobileLayout(ColorScheme colorScheme) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _studentCard(colorScheme),
        _usedTotal(colorScheme),
        _studentAverage(colorScheme),
        _registerStudentForm(),
        _studentList(),
      ],
    );
  }

  Widget _studentCard(ColorScheme colorScheme) {
    return StatisticCard(
      label: 'Total de alunos',
      amount: students.length.toString(),
      backgroundColor: colorScheme.tertiaryContainer,
      textColor: colorScheme.onTertiaryContainer,
    );
  }

  Widget _usedTotal(ColorScheme colorScheme) {
    return StatisticCard(
      label: 'Total distribuído',
      amount: 'R\$ 150.75',
      backgroundColor: colorScheme.primaryContainer,
      textColor: colorScheme.onPrimaryContainer,
    );
  }

  Widget _studentAverage(ColorScheme colorScheme) {
    return StatisticCard(
      label: 'Média por aluno',
      amount: 'R\$ 50.25',
      backgroundColor: colorScheme.secondaryContainer,
      textColor: colorScheme.onSecondaryContainer,
    );
  }

  Widget _studentList() {
    return InfoCard(
      label: 'Lista de alunos',
      content: Column(
        spacing: 12,
        children: students.map((studentName) {
          return ListTile(
            leading: Icon(Icons.person, size: 18, color: Colors.cyanAccent),
            title: Text(studentName, style: TextStyle(color: Colors.white)),
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
    );
  }

  Widget _registerStudentForm() {
    return InfoCard(
      label: 'Controle de fundos',
      content: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(decoration: InputDecoration(labelText: 'Aluno')),
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: 'Valor'),
                ),
              ),
              Expanded(child: _transactionTypeMenu()),
            ],
          ),
          TextField(decoration: InputDecoration(labelText: 'Descrição')),
          FilledButton.icon(
            onPressed: () => print('Cadastrado'),
            label: Text('Cadastrar'),
          ),
        ],
      ),
    );
  }

  Widget _transactionTypeMenu() {
    return DropdownMenu<TransactionType>(
      label: Text('Tipo de transação'),
      initialSelection: TransactionType.debit,
      onSelected: (value) => print(value?.label),
      inputDecorationTheme: InputDecorationTheme(
        constraints: BoxConstraints(minWidth: double.infinity),
      ),
      dropdownMenuEntries: TransactionType.values.map((e) {
        return DropdownMenuEntry<TransactionType>(value: e, label: e.label);
      }).toList(),
    );
  }

  Widget _warningMessage() {
    return WarningCard(
      message:
          'Este aplicativo é destinado exclusivamente para fins educacionais. Todos os valores exibidos são fictícios e não representam transações financeiras reais.',
    );
  }
}
