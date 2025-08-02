import 'package:edu_financas/application/main.dart';
import 'package:edu_financas/domain/main.dart';
import 'package:edu_financas/presentation/widgets/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionSection extends StatefulWidget {
  const TransactionSection({super.key});

  @override
  State<TransactionSection> createState() => _TransactionSectionState();
}

class _TransactionSectionState extends State<TransactionSection> {
  TransactionType _type = TransactionType.credit;

  void _onTransactionType(TransactionType? type) {
    if (type == null) {
      return;
    }

    setState(() {
      _type = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfessorPageProvider>(
      builder: (_, provider, __) {
        return InfoCard(
          label: 'Controle de fundos',
          content: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(children: [Expanded(child: _studentSelect(provider))]),
              Row(
                spacing: 12,
                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Valor'),
                    ),
                  ),
                  Expanded(flex: 1, child: _transactionTypeMenu()),
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
      },
    );
  }

  Widget _studentSelect(ProfessorPageProvider provider) {
    return DropdownButtonFormField<String>(
      hint: Text('Aluno'),
      onChanged: (value) => print(value),
      items:
          provider.students?.map((student) {
            return DropdownMenuItem<String>(
              value: student.name,
              child: Text(student.name),
            );
          }).toList() ??
          [],
    );
  }

  Widget _transactionTypeMenu() {
    return DropdownButtonFormField<TransactionType>(
      hint: Text('Tipo de transação'),
      value: _type,
      onChanged: _onTransactionType,
      items: TransactionType.values.map((e) {
        return DropdownMenuItem<TransactionType>(
          value: e,
          child: Text(e.label),
        );
      }).toList(),
    );
  }
}
