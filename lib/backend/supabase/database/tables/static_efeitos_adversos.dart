import '../database.dart';

class StaticEfeitosAdversosTable
    extends SupabaseTable<StaticEfeitosAdversosRow> {
  @override
  String get tableName => 'static_efeitos_adversos';

  @override
  StaticEfeitosAdversosRow createRow(Map<String, dynamic> data) =>
      StaticEfeitosAdversosRow(data);
}

class StaticEfeitosAdversosRow extends SupabaseDataRow {
  StaticEfeitosAdversosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StaticEfeitosAdversosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get efeito => getField<String>('efeito');
  set efeito(String? value) => setField<String>('efeito', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);
}
