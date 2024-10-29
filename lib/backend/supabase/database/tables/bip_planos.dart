import '../database.dart';

class BipPlanosTable extends SupabaseTable<BipPlanosRow> {
  @override
  String get tableName => 'bipPlanos';

  @override
  BipPlanosRow createRow(Map<String, dynamic> data) => BipPlanosRow(data);
}

class BipPlanosRow extends SupabaseDataRow {
  BipPlanosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BipPlanosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get qntdBip => getField<int>('qntd_bip');
  set qntdBip(int? value) => setField<int>('qntd_bip', value);

  bool? get incluiConsulta => getField<bool>('inclui_consulta');
  set incluiConsulta(bool? value) => setField<bool>('inclui_consulta', value);

  int? get duracaoConsulta => getField<int>('duracao_consulta');
  set duracaoConsulta(int? value) => setField<int>('duracao_consulta', value);

  int? get valor => getField<int>('valor');
  set valor(int? value) => setField<int>('valor', value);
}
