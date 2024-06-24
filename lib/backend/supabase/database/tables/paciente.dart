import '../database.dart';

class PacienteTable extends SupabaseTable<PacienteRow> {
  @override
  String get tableName => 'paciente';

  @override
  PacienteRow createRow(Map<String, dynamic> data) => PacienteRow(data);
}

class PacienteRow extends SupabaseDataRow {
  PacienteRow(super.data);

  @override
  SupabaseTable get table => PacienteTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get uuid => getField<String>('uuid');
  set uuid(String? value) => setField<String>('uuid', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get profilePic => getField<String>('profile_pic');
  set profilePic(String? value) => setField<String>('profile_pic', value);

  String? get telefone => getField<String>('telefone');
  set telefone(String? value) => setField<String>('telefone', value);

  String? get cpf => getField<String>('cpf');
  set cpf(String? value) => setField<String>('cpf', value);

  List<String> get queixas => getListField<String>('queixas');
  set queixas(List<String>? value) => setListField<String>('queixas', value);

  List<String> get contraIndicacoes =>
      getListField<String>('contra_indicacoes');
  set contraIndicacoes(List<String>? value) =>
      setListField<String>('contra_indicacoes', value);

  int? get firstOnboarding => getField<int>('first_onboarding');
  set firstOnboarding(int? value) => setField<int>('first_onboarding', value);

  bool? get perfilCompleto => getField<bool>('perfil_completo');
  set perfilCompleto(bool? value) => setField<bool>('perfil_completo', value);

  double? get altura => getField<double>('altura');
  set altura(double? value) => setField<double>('altura', value);

  double? get peso => getField<double>('Peso');
  set peso(double? value) => setField<double>('Peso', value);

  int? get medicoPrescritor => getField<int>('medico_prescritor');
  set medicoPrescritor(int? value) => setField<int>('medico_prescritor', value);
}
