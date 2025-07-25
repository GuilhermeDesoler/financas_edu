import 'package:edu_financas/application/main.dart';
import 'package:edu_financas/presentation/widgets/main.dart';
import 'package:flutter/material.dart';

class StatisticsSection extends StatefulWidget {
  const StatisticsSection({required this.provider, super.key});

  final ProfessorPageProvider provider;

  @override
  State<StatisticsSection> createState() => _StatisticsSectionState();
}

class _StatisticsSectionState extends State<StatisticsSection> {
  @override
  void initState() {
    widget.provider.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final device = ResponsiveService(context);

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (device.isDesktop) {
      return Row(
        spacing: 16,
        children: [
          Expanded(child: _studentCard(colorScheme)),
          Expanded(child: _usedTotal(colorScheme)),
          Expanded(child: _studentAverage(colorScheme)),
        ],
      );
    }

    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _studentCard(colorScheme),
        _usedTotal(colorScheme),
        _studentAverage(colorScheme),
      ],
    );
  }

  Widget _studentCard(ColorScheme colorScheme) {
    final studentsAmount =
        widget.provider.professor?.students.length.toString() ?? '--';

    return StatisticCard(
      label: 'Total de alunos',
      amount: studentsAmount,
      backgroundColor: colorScheme.tertiaryContainer,
      textColor: colorScheme.onTertiaryContainer,
    );
  }

  Widget _usedTotal(ColorScheme colorScheme) {
    final amountSpent =
        widget.provider.professor?.spent.toStringAsFixed(2) ?? '--';

    return StatisticCard(
      label: 'Total distribuído',
      amount: 'R\$ $amountSpent',
      backgroundColor: colorScheme.primaryContainer,
      textColor: colorScheme.onPrimaryContainer,
    );
  }

  Widget _studentAverage(ColorScheme colorScheme) {
    final average = widget.provider.average == null
        ? '--'
        : widget.provider.average!.toStringAsFixed(2);

    return StatisticCard(
      label: 'Média por aluno',
      amount: 'R\$ $average',
      backgroundColor: colorScheme.secondaryContainer,
      textColor: colorScheme.onSecondaryContainer,
    );
  }
}
