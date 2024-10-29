import '../database.dart';

class ConsumotrackTable extends SupabaseTable<ConsumotrackRow> {
  @override
  String get tableName => 'consumotrack';

  @override
  ConsumotrackRow createRow(Map<String, dynamic> data) => ConsumotrackRow(data);
}

class ConsumotrackRow extends SupabaseDataRow {
  ConsumotrackRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ConsumotrackTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get prescricao => getField<int>('prescricao');
  set prescricao(int? value) => setField<int>('prescricao', value);

  int? get medicamento => getField<int>('medicamento');
  set medicamento(int? value) => setField<int>('medicamento', value);

  bool? get consumido => getField<bool>('consumido');
  set consumido(bool? value) => setField<bool>('consumido', value);

  DateTime? get hour => getField<DateTime>('hour');
  set hour(DateTime? value) => setField<DateTime>('hour', value);

  dynamic? get dadosConsumo => getField<dynamic>('dados_consumo');
  set dadosConsumo(dynamic? value) => setField<dynamic>('dados_consumo', value);
}
