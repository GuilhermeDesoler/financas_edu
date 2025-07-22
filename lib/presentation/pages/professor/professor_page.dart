import 'package:edu_financas/application/main.dart';
import 'package:edu_financas/presentation/widgets/main.dart';
import 'package:flutter/material.dart';

class ProfessorPage extends StatelessWidget {
  const ProfessorPage({super.key});

  List<String> get students => ['Chawee', 'Max', 'Sarah', 'Guilherme'];

  @override
  Widget build(BuildContext context) {
    final device = ResponsiveService(context);

    return AppPage(
      body: Column(
        spacing: 16,
        children: [
          Row(children: [Expanded(child: _warningMessage())]),
          SectionCard(
            label: 'Painel do professor',
            content: device.isPhone ? _mobileLayout() : _desktopLayout(),
          ),
        ],
      ),
    );
  }

  Widget _desktopLayout() {
    return Column(
      spacing: 16,
      children: [
        Row(
          spacing: 16,
          children: [
            Expanded(child: _studentCard()),
            Expanded(child: _usedTotal()),
            Expanded(child: _studentAverage()),
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

  Widget _mobileLayout() {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _studentCard(),
        _usedTotal(),
        _studentAverage(),
        _registerStudentForm(),
        _studentList(),
      ],
    );
  }

  Widget _studentCard() {
    return StatisticCard(
      label: 'Total de alunos',
      amount: students.length.toString(),
      backgroundColor: Colors.indigoAccent,
      textColor: Colors.indigo,
    );
  }

  Widget _usedTotal() {
    return StatisticCard(
      label: 'Total distribuído',
      amount: 'R\$ 150.75',
      backgroundColor: Colors.greenAccent,
      textColor: Colors.green,
    );
  }

  Widget _studentAverage() {
    return StatisticCard(
      label: 'Média por aluno',
      amount: 'R\$ 50.25',
      backgroundColor: Colors.purpleAccent,
      textColor: Colors.purple,
    );
  }

  Widget _studentList() {
    return InfoCard(
      label: 'Lista de alunos',
      // content: ListView(
      //   children: students.map((studentName) {
      //     return ListTile(
      //       leading: Icon(Icons.person, size: 18, color: Colors.cyanAccent),
      //       title: Text(studentName, style: TextStyle(color: Colors.white)),
      //     );
      //   }).toList(),
      // ),
      content: Column(
        spacing: 4,
        children: students.map((studentName) {
          return ListTile(
            leading: Icon(Icons.person, size: 18, color: Colors.cyanAccent),
            title: Text(studentName, style: TextStyle(color: Colors.white)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(width: 1, color: Colors.grey),
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
        children: [
          TextField(decoration: InputDecoration(labelText: 'Aluno')),
          TextField(
            decoration: InputDecoration(labelText: 'Tipo de transação'),
          ),
          TextField(decoration: InputDecoration(labelText: 'Valor')),
          TextField(decoration: InputDecoration(labelText: 'Descrição')),
          Row(
            children: [
              FilledButton.icon(
                onPressed: () => print('Cadastrado'),
                label: Text('Cadastrar'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _warningMessage() {
    return WarningCard(
      message:
          'Este aplicativo é destinado exclusivamente para fins educacionais. Todos os valores exibidos são fictícios e não representam transações financeiras reais.',
    );
  }
}
