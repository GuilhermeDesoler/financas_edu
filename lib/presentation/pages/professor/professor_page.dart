import 'package:edu_financas/application/main.dart';
import 'package:edu_financas/presentation/pages/professor/widgets/main.dart';
import 'package:edu_financas/presentation/widgets/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfessorPage extends StatefulWidget {
  const ProfessorPage({super.key});

  @override
  State<ProfessorPage> createState() => _ProfessorPageState();
}

class _ProfessorPageState extends State<ProfessorPage> {
  Future<void> _init() async {
    final provider = Provider.of<ProfessorPageProvider>(context, listen: false);
    await provider.fetchData();
  }

  @override
  void initState() {
    Future.microtask(_init);
    super.initState();
  }

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
        Align(
          alignment: Alignment.centerRight,
          child: _refreshButton(),
        ),
        StatisticsSection(),
        Row(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: StudentsList()),
            Expanded(child: TransactionSection()),
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
        Align(
          alignment: Alignment.centerRight,
          child: _refreshButton(),
        ),
        StatisticsSection(),
        TransactionSection(),
        StudentsList(),
      ],
    );
  }

  Widget _refreshButton() {
    return Consumer<ProfessorPageProvider>(
      builder: (_, provider, __) {
        return RefreshButon(
          loading: provider.loading,
          onPressed: provider.fetchData,
        );
      },
    );
  }

  Widget _warningMessage() {
    return WarningCard(
      message:
          'Este aplicativo é destinado exclusivamente para fins educacionais. Todos os valores exibidos são fictícios e não representam transações financeiras reais.',
    );
  }
}
