import '../database.dart';

class StaticContraIndicacaoTable
    extends SupabaseTable<StaticContraIndicacaoRow> {
  @override
  String get tableName => 'static_contra_indicacao';

  @override
  StaticContraIndicacaoRow createRow(Map<String, dynamic> data) =>
      StaticContraIndicacaoRow(data);
}

class StaticContraIndicacaoRow extends SupabaseDataRow {
  StaticContraIndicacaoRow(super.data);

  @override
  SupabaseTable get table => StaticContraIndicacaoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);
}
