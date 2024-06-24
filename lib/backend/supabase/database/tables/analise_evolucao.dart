import '../database.dart';

class AnaliseEvolucaoTable extends SupabaseTable<AnaliseEvolucaoRow> {
  @override
  String get tableName => 'analise_evolucao';

  @override
  AnaliseEvolucaoRow createRow(Map<String, dynamic> data) =>
      AnaliseEvolucaoRow(data);
}

class AnaliseEvolucaoRow extends SupabaseDataRow {
  AnaliseEvolucaoRow(super.data);

  @override
  SupabaseTable get table => AnaliseEvolucaoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get titulo => getField<String>('titulo');
  set titulo(String? value) => setField<String>('titulo', value);

  String? get nivel => getField<String>('nivel');
  set nivel(String? value) => setField<String>('nivel', value);

  String? get analise => getField<String>('analise');
  set analise(String? value) => setField<String>('analise', value);

  int? get paciente => getField<int>('Paciente');
  set paciente(int? value) => setField<int>('Paciente', value);
}
