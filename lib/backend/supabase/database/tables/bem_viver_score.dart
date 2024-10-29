import '../database.dart';

class BemViverScoreTable extends SupabaseTable<BemViverScoreRow> {
  @override
  String get tableName => 'bem_viver_score';

  @override
  BemViverScoreRow createRow(Map<String, dynamic> data) =>
      BemViverScoreRow(data);
}

class BemViverScoreRow extends SupabaseDataRow {
  BemViverScoreRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BemViverScoreTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  double? get scoreViv => getField<double>('score_viv');
  set scoreViv(double? value) => setField<double>('score_viv', value);

  int? get paciente => getField<int>('paciente');
  set paciente(int? value) => setField<int>('paciente', value);

  List<int> get queixasVinculadas => getListField<int>('queixas_vinculadas');
  set queixasVinculadas(List<int>? value) =>
      setListField<int>('queixas_vinculadas', value);

  List<String> get sintomas => getListField<String>('sintomas');
  set sintomas(List<String>? value) => setListField<String>('sintomas', value);

  int? get humor => getField<int>('humor');
  set humor(int? value) => setField<int>('humor', value);

  String? get observacoes => getField<String>('observacoes');
  set observacoes(String? value) => setField<String>('observacoes', value);
}
