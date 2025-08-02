import 'package:edu_financas/application/main.dart';
import 'package:edu_financas/presentation/widgets/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final device = ResponsiveService(context);

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Consumer<ProfessorPageProvider>(builder: (_, provider, __) {
      if (device.isDesktop) {
        return Row(
          spacing: 16,
          children: [
            Expanded(child: _studentCard(provider, colorScheme)),
            Expanded(child: _usedTotal(provider, colorScheme)),
            Expanded(child: _studentAverage(provider, colorScheme)),
          ],
        );
      }

      return Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _studentCard(provider, colorScheme),
          _usedTotal(provider, colorScheme),
          _studentAverage(provider, colorScheme),
        ],
      );
    });
  }

  Widget _studentCard(ProfessorPageProvider provider, ColorScheme colorScheme) {
    final studentsAmount =
        provider.professor?.students.length.toString() ?? '--';

    return StatisticCard(
      label: 'Total de alunos',
      amount: studentsAmount,
      backgroundColor: colorScheme.tertiaryContainer,
      textColor: colorScheme.onTertiaryContainer,
    );
  }

  Widget _usedTotal(ProfessorPageProvider provider, ColorScheme colorScheme) {
    final amountSpent = provider.professor?.spent.toStringAsFixed(2) ?? '--';

    return StatisticCard(
      label: 'Total distribuído',
      amount: 'R\$ $amountSpent',
      backgroundColor: colorScheme.primaryContainer,
      textColor: colorScheme.onPrimaryContainer,
    );
  }

  Widget _studentAverage(
      ProfessorPageProvider provider, ColorScheme colorScheme) {
    final average =
        provider.average == null ? '--' : provider.average!.toStringAsFixed(2);

    return StatisticCard(
      label: 'Média por aluno',
      amount: 'R\$ $average',
      backgroundColor: colorScheme.secondaryContainer,
      textColor: colorScheme.onSecondaryContainer,
    );
  }
}
