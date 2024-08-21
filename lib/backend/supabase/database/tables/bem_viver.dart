import '../database.dart';

class BemViverTable extends SupabaseTable<BemViverRow> {
  @override
  String get tableName => 'bem_viver';

  @override
  BemViverRow createRow(Map<String, dynamic> data) => BemViverRow(data);
}

class BemViverRow extends SupabaseDataRow {
  BemViverRow(super.data);

  @override
  SupabaseTable get table => BemViverTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get paciente => getField<int>('paciente');
  set paciente(int? value) => setField<int>('paciente', value);

  double? get score => getField<double>('score');
  set score(double? value) => setField<double>('score', value);

  int? get queixa => getField<int>('queixa');
  set queixa(int? value) => setField<int>('queixa', value);

  String? get resposta => getField<String>('resposta');
  set resposta(String? value) => setField<String>('resposta', value);

  String? get pergunta => getField<String>('pergunta');
  set pergunta(String? value) => setField<String>('pergunta', value);

  int? get peso => getField<int>('peso');
  set peso(int? value) => setField<int>('peso', value);

  String? get periodo => getField<String>('periodo');
  set periodo(String? value) => setField<String>('periodo', value);
}
