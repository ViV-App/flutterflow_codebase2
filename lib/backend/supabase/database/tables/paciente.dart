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

  double? get peso => getField<double>('peso');
  set peso(double? value) => setField<double>('peso', value);

  int? get medicoPrescritor => getField<int>('medico_prescritor');
  set medicoPrescritor(int? value) => setField<int>('medico_prescritor', value);

  String? get tramentoPrevio => getField<String>('tramentoPrevio');
  set tramentoPrevio(String? value) =>
      setField<String>('tramentoPrevio', value);

  bool? get dadosCadPreenchidos => getField<bool>('dados_cad_preenchidos');
  set dadosCadPreenchidos(bool? value) =>
      setField<bool>('dados_cad_preenchidos', value);

  bool? get histMedicoPreenchido => getField<bool>('hist_medico_preenchido');
  set histMedicoPreenchido(bool? value) =>
      setField<bool>('hist_medico_preenchido', value);

  bool? get famSocialHistPreenchido =>
      getField<bool>('fam_social_hist_preenchido');
  set famSocialHistPreenchido(bool? value) =>
      setField<bool>('fam_social_hist_preenchido', value);

  bool? get lifestylePreenchido => getField<bool>('lifestyle_preenchido');
  set lifestylePreenchido(bool? value) =>
      setField<bool>('lifestyle_preenchido', value);

  bool? get funcionalidadePreenchida =>
      getField<bool>('funcionalidade_preenchida');
  set funcionalidadePreenchida(bool? value) =>
      setField<bool>('funcionalidade_preenchida', value);

  String? get asaasCustomerId => getField<String>('asaas_customer_id');
  set asaasCustomerId(String? value) =>
      setField<String>('asaas_customer_id', value);

  String? get queixaPrincipal => getField<String>('queixa_principal');
  set queixaPrincipal(String? value) =>
      setField<String>('queixa_principal', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get fcmToken => getField<String>('fcm_token');
  set fcmToken(String? value) => setField<String>('fcm_token', value);

  int? get statusAtual => getField<int>('status_atual');
  set statusAtual(int? value) => setField<int>('status_atual', value);

  int? get planoAtual => getField<int>('plano_atual');
  set planoAtual(int? value) => setField<int>('plano_atual', value);
}
