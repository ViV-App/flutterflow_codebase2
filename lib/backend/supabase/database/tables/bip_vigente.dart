import '../database.dart';

class BipVigenteTable extends SupabaseTable<BipVigenteRow> {
  @override
  String get tableName => 'bipVigente';

  @override
  BipVigenteRow createRow(Map<String, dynamic> data) => BipVigenteRow(data);
}

class BipVigenteRow extends SupabaseDataRow {
  BipVigenteRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BipVigenteTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get paciente => getField<int>('paciente');
  set paciente(int? value) => setField<int>('paciente', value);

  DateTime? get dataInicio => getField<DateTime>('data_inicio');
  set dataInicio(DateTime? value) => setField<DateTime>('data_inicio', value);

  DateTime? get dataValidade => getField<DateTime>('data_validade');
  set dataValidade(DateTime? value) =>
      setField<DateTime>('data_validade', value);

  int? get qntdBipAssinatura => getField<int>('qntdBipAssinatura');
  set qntdBipAssinatura(int? value) =>
      setField<int>('qntdBipAssinatura', value);

  int? get qntdDisponivel => getField<int>('qntdDisponivel');
  set qntdDisponivel(int? value) => setField<int>('qntdDisponivel', value);

  int? get qntdBipAddon => getField<int>('qntdBipAddon');
  set qntdBipAddon(int? value) => setField<int>('qntdBipAddon', value);
}
