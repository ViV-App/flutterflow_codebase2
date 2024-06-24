import '../database.dart';

class StaticMedicamentosTable extends SupabaseTable<StaticMedicamentosRow> {
  @override
  String get tableName => 'static_medicamentos';

  @override
  StaticMedicamentosRow createRow(Map<String, dynamic> data) =>
      StaticMedicamentosRow(data);
}

class StaticMedicamentosRow extends SupabaseDataRow {
  StaticMedicamentosRow(super.data);

  @override
  SupabaseTable get table => StaticMedicamentosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get categoria => getField<String>('categoria');
  set categoria(String? value) => setField<String>('categoria', value);

  bool? get aprovado => getField<bool>('aprovado');
  set aprovado(bool? value) => setField<bool>('aprovado', value);
}
