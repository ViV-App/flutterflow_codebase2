import '../database.dart';

class PlanosAssinaturaTable extends SupabaseTable<PlanosAssinaturaRow> {
  @override
  String get tableName => 'planos_assinatura';

  @override
  PlanosAssinaturaRow createRow(Map<String, dynamic> data) =>
      PlanosAssinaturaRow(data);
}

class PlanosAssinaturaRow extends SupabaseDataRow {
  PlanosAssinaturaRow(super.data);

  @override
  SupabaseTable get table => PlanosAssinaturaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get titulo => getField<String>('titulo');
  set titulo(String? value) => setField<String>('titulo', value);

  int? get valor => getField<int>('valor');
  set valor(int? value) => setField<int>('valor', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  List<String> get beneficios => getListField<String>('beneficios');
  set beneficios(List<String>? value) =>
      setListField<String>('beneficios', value);

  bool? get ativado => getField<bool>('ativado');
  set ativado(bool? value) => setField<bool>('ativado', value);
}
