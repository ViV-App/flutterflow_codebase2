import '../database.dart';

class BemEstarTable extends SupabaseTable<BemEstarRow> {
  @override
  String get tableName => 'bem_estar';

  @override
  BemEstarRow createRow(Map<String, dynamic> data) => BemEstarRow(data);
}

class BemEstarRow extends SupabaseDataRow {
  BemEstarRow(super.data);

  @override
  SupabaseTable get table => BemEstarTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get paciente => getField<int>('paciente');
  set paciente(int? value) => setField<int>('paciente', value);

  int? get ansiedade => getField<int>('ansiedade');
  set ansiedade(int? value) => setField<int>('ansiedade', value);

  int? get dor => getField<int>('dor');
  set dor(int? value) => setField<int>('dor', value);

  int? get humor => getField<int>('humor');
  set humor(int? value) => setField<int>('humor', value);

  int? get sono => getField<int>('sono');
  set sono(int? value) => setField<int>('sono', value);

  List<String> get sintomas => getListField<String>('sintomas');
  set sintomas(List<String>? value) => setListField<String>('sintomas', value);

  String? get observacao => getField<String>('observacao');
  set observacao(String? value) => setField<String>('observacao', value);
}
