import 'package:edu_financas/application/main.dart';
import 'package:edu_financas/presentation/widgets/main.dart';
import 'package:flutter/material.dart';

class ProfessorPage extends StatelessWidget {
  const ProfessorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final device = ResponsiveService(context);

    return AppPage(
      body: Column(
        spacing: 16,
        children: [
          Row(
            children: [
              Expanded(child: _warningMessage()),
            ],
          ),
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
      children: [
        Row(
          spacing: 16,
          children: [
            Expanded(child: _studentCard()),
            Expanded(child: _usedTotal()),
            Expanded(child: _studentAverage()),
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
      ],
    );
  }

  Widget _studentCard() {
    return StatisticCard(
      label: 'Total de alunos',
      amount: '3',
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

  Widget _warningMessage() {
    return WarningCard(
        message:
            'Este aplicativo é destinado exclusivamente para fins educacionais. Todos os valores exibidos são fictícios e não representam transações financeiras reais.');
  }
}
