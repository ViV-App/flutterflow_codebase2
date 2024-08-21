import '../database.dart';

class DadosCadastraisTable extends SupabaseTable<DadosCadastraisRow> {
  @override
  String get tableName => 'dados_cadastrais';

  @override
  DadosCadastraisRow createRow(Map<String, dynamic> data) =>
      DadosCadastraisRow(data);
}

class DadosCadastraisRow extends SupabaseDataRow {
  DadosCadastraisRow(super.data);

  @override
  SupabaseTable get table => DadosCadastraisTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get paciente => getField<int>('paciente');
  set paciente(int? value) => setField<int>('paciente', value);

  DateTime? get dataNascimento => getField<DateTime>('data_nascimento');
  set dataNascimento(DateTime? value) =>
      setField<DateTime>('data_nascimento', value);

  String? get estadoCivil => getField<String>('estado_civil');
  set estadoCivil(String? value) => setField<String>('estado_civil', value);

  String? get principalProfissao => getField<String>('principal_profissao');
  set principalProfissao(String? value) =>
      setField<String>('principal_profissao', value);

  int? get qntdTempoTrabalhado => getField<int>('qntd_tempo_trabalhado');
  set qntdTempoTrabalhado(int? value) =>
      setField<int>('qntd_tempo_trabalhado', value);

  bool? get isEstrangeiro => getField<bool>('is_estrangeiro');
  set isEstrangeiro(bool? value) => setField<bool>('is_estrangeiro', value);

  bool? get temDocumentos => getField<bool>('tem_documentos');
  set temDocumentos(bool? value) => setField<bool>('tem_documentos', value);

  List<String> get documentos => getListField<String>('documentos');
  set documentos(List<String>? value) =>
      setListField<String>('documentos', value);

  String? get passaporte => getField<String>('passaporte');
  set passaporte(String? value) => setField<String>('passaporte', value);
}
