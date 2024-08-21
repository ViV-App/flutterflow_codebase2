import '../database.dart';

class AjusteDoseRequisicaoTable extends SupabaseTable<AjusteDoseRequisicaoRow> {
  @override
  String get tableName => 'ajuste_dose_requisicao';

  @override
  AjusteDoseRequisicaoRow createRow(Map<String, dynamic> data) =>
      AjusteDoseRequisicaoRow(data);
}

class AjusteDoseRequisicaoRow extends SupabaseDataRow {
  AjusteDoseRequisicaoRow(super.data);

  @override
  SupabaseTable get table => AjusteDoseRequisicaoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get requisicaoData => getField<DateTime>('requisicao_data');
  set requisicaoData(DateTime? value) =>
      setField<DateTime>('requisicao_data', value);

  bool? get formGeralPreenchido => getField<bool>('formGeralPreenchido');
  set formGeralPreenchido(bool? value) =>
      setField<bool>('formGeralPreenchido', value);

  bool? get formEspecificPreenchido =>
      getField<bool>('formEspecificPreenchido');
  set formEspecificPreenchido(bool? value) =>
      setField<bool>('formEspecificPreenchido', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get paciente => getField<int>('paciente');
  set paciente(int? value) => setField<int>('paciente', value);

  int? get bipVIgente => getField<int>('bipVIgente');
  set bipVIgente(int? value) => setField<int>('bipVIgente', value);
}
