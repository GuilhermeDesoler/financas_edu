enum Category {
  mensalidade('mensalidade', 'Mensalidade'),
  material('material', 'Material escolar'),
  alimentacao('alimentacao', 'Alimentação'),
  uniforme('uniforme', 'Uniforme'),
  transporte('transporte', 'Transporte'),
  passeio('passeio', 'Passeio/Evento'),
  outro('outro', 'Outro');

  const Category(this.key, this.label);

  final String key;
  final String label;

  static Category fromString(String value) {
    return Category.values.firstWhere(
      (e) => e.key == value,
      orElse: () => outro,
    );
  }
}
