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

  bool? get formEspecificPreenchido =>
      getField<bool>('formEspecificPreenchido');
  set formEspecificPreenchido(bool? value) =>
      setField<bool>('formEspecificPreenchido', value);

  int? get paciente => getField<int>('paciente');
  set paciente(int? value) => setField<int>('paciente', value);

  int? get bipVIgente => getField<int>('bipVIgente');
  set bipVIgente(int? value) => setField<int>('bipVIgente', value);

  bool? get produto => getField<bool>('produto');
  set produto(bool? value) => setField<bool>('produto', value);

  bool? get dadosGerais => getField<bool>('dadosGerais');
  set dadosGerais(bool? value) => setField<bool>('dadosGerais', value);

  bool? get pam => getField<bool>('pam');
  set pam(bool? value) => setField<bool>('pam', value);

  List<String> get queixasNaoRespondidas =>
      getListField<String>('queixasNaoRespondidas');
  set queixasNaoRespondidas(List<String>? value) =>
      setListField<String>('queixasNaoRespondidas', value);

  List<String> get queixasRespondidas =>
      getListField<String>('queixasRespondidas');
  set queixasRespondidas(List<String>? value) =>
      setListField<String>('queixasRespondidas', value);
}
