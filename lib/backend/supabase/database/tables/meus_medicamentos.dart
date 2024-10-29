import '../database.dart';

class MeusMedicamentosTable extends SupabaseTable<MeusMedicamentosRow> {
  @override
  String get tableName => 'meus_medicamentos';

  @override
  MeusMedicamentosRow createRow(Map<String, dynamic> data) =>
      MeusMedicamentosRow(data);
}

class MeusMedicamentosRow extends SupabaseDataRow {
  MeusMedicamentosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MeusMedicamentosTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get categoria => getField<String>('categoria');
  set categoria(String? value) => setField<String>('categoria', value);

  bool? get aprovado => getField<bool>('aprovado');
  set aprovado(bool? value) => setField<bool>('aprovado', value);

  int? get prescricao => getField<int>('prescricao');
  set prescricao(int? value) => setField<int>('prescricao', value);
}
