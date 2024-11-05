import '../database.dart';

class VwPacienteCadastralDataTable
    extends SupabaseTable<VwPacienteCadastralDataRow> {
  @override
  String get tableName => 'vw_paciente_cadastral_data';

  @override
  VwPacienteCadastralDataRow createRow(Map<String, dynamic> data) =>
      VwPacienteCadastralDataRow(data);
}

class VwPacienteCadastralDataRow extends SupabaseDataRow {
  VwPacienteCadastralDataRow(super.data);

  @override
  SupabaseTable get table => VwPacienteCadastralDataTable();

  int? get pacienteId => getField<int>('paciente_id');
  set pacienteId(int? value) => setField<int>('paciente_id', value);

  String? get pacienteNome => getField<String>('paciente_nome');
  set pacienteNome(String? value) => setField<String>('paciente_nome', value);

  String? get pacienteEmail => getField<String>('paciente_email');
  set pacienteEmail(String? value) => setField<String>('paciente_email', value);

  String? get pacienteTelefone => getField<String>('paciente_telefone');
  set pacienteTelefone(String? value) =>
      setField<String>('paciente_telefone', value);

  DateTime? get dataNascimento => getField<DateTime>('data_nascimento');
  set dataNascimento(DateTime? value) =>
      setField<DateTime>('data_nascimento', value);

  String? get estadoCivil => getField<String>('estado_civil');
  set estadoCivil(String? value) => setField<String>('estado_civil', value);

  String? get principalProfissao => getField<String>('principal_profissao');
  set principalProfissao(String? value) =>
      setField<String>('principal_profissao', value);

  String? get dedicacaoTrabalho => getField<String>('dedicacao_trabalho');
  set dedicacaoTrabalho(String? value) =>
      setField<String>('dedicacao_trabalho', value);

  bool? get isEstrangeiro => getField<bool>('is_estrangeiro');
  set isEstrangeiro(bool? value) => setField<bool>('is_estrangeiro', value);

  bool? get temDocumentos => getField<bool>('tem_documentos');
  set temDocumentos(bool? value) => setField<bool>('tem_documentos', value);

  List<String> get documentos => getListField<String>('documentos');
  set documentos(List<String>? value) =>
      setListField<String>('documentos', value);

  String? get passaporte => getField<String>('passaporte');
  set passaporte(String? value) => setField<String>('passaporte', value);

  int? get alturaDadosCadastrais => getField<int>('altura_dados_cadastrais');
  set alturaDadosCadastrais(int? value) =>
      setField<int>('altura_dados_cadastrais', value);

  int? get pesoDadosCadastrais => getField<int>('peso_dados_cadastrais');
  set pesoDadosCadastrais(int? value) =>
      setField<int>('peso_dados_cadastrais', value);

  String? get sexo => getField<String>('sexo');
  set sexo(String? value) => setField<String>('sexo', value);

  String? get identidadeGenero => getField<String>('identidade_genero');
  set identidadeGenero(String? value) =>
      setField<String>('identidade_genero', value);

  double? get alturaPaciente => getField<double>('altura_paciente');
  set alturaPaciente(double? value) =>
      setField<double>('altura_paciente', value);

  double? get pesoPaciente => getField<double>('peso_paciente');
  set pesoPaciente(double? value) => setField<double>('peso_paciente', value);

  String? get queixaPrincipal => getField<String>('queixa_principal');
  set queixaPrincipal(String? value) =>
      setField<String>('queixa_principal', value);

  List<String> get queixas => getListField<String>('queixas');
  set queixas(List<String>? value) => setListField<String>('queixas', value);
}
