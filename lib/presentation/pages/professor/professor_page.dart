import 'package:edu_financas/application/main.dart';
import 'package:edu_financas/presentation/pages/professor/widgets/main.dart';
import 'package:edu_financas/presentation/widgets/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfessorPage extends StatelessWidget {
  const ProfessorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final device = ResponsiveService(context);

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Consumer<ProfessorPageProvider>(
      builder: (_, professorProvider, __) {
        return AppPage(
          body: Column(
            spacing: 16,
            children: [
              Row(children: [Expanded(child: _warningMessage())]),
              SectionCard(
                label: 'Painel do professor',
                content: device.isPhone
                    ? _mobileLayout(professorProvider, colorScheme)
                    : _desktopLayout(professorProvider, colorScheme),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _desktopLayout(
    ProfessorPageProvider professorProvider,
    ColorScheme colorScheme,
  ) {
    return Column(
      spacing: 16,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: _refreshButton(professorProvider),
        ),
        StatisticsSection(provider: professorProvider),
        Row(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Expanded(child: StudentsList(provider: professorProvider)),
            Expanded(child: TransactionSection()),
          ],
        ),
      ],
    );
  }

  Widget _mobileLayout(
    ProfessorPageProvider professorProvider,
    ColorScheme colorScheme,
  ) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: _refreshButton(professorProvider),
        ),
        StatisticsSection(provider: professorProvider),
        TransactionSection(),
        // StudentsList(provider: professorProvider),
      ],
    );
  }

  Widget _refreshButton(ProfessorPageProvider professorProvider) {
    return AppButton(
      type: ButtonType.outline,
      label: 'Buscar',
      icon: Icons.download_outlined,
      loading: professorProvider.loading,
      onPressed: professorProvider.fetchData,
    );
  }

  Widget _warningMessage() {
    return WarningCard(
      message:
          'Este aplicativo é destinado exclusivamente para fins educacionais. Todos os valores exibidos são fictícios e não representam transações financeiras reais.',
    );
  }
}
