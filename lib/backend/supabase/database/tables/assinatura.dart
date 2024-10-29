import '../database.dart';

class AssinaturaTable extends SupabaseTable<AssinaturaRow> {
  @override
  String get tableName => 'assinatura';

  @override
  AssinaturaRow createRow(Map<String, dynamic> data) => AssinaturaRow(data);
}

class AssinaturaRow extends SupabaseDataRow {
  AssinaturaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AssinaturaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get plano => getField<int>('plano');
  set plano(int? value) => setField<int>('plano', value);

  int? get paciente => getField<int>('paciente');
  set paciente(int? value) => setField<int>('paciente', value);

  String? get asaasSubscId => getField<String>('asaas_subsc_id');
  set asaasSubscId(String? value) => setField<String>('asaas_subsc_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  bool? get registroBemViver => getField<bool>('registroBemViver');
  set registroBemViver(bool? value) =>
      setField<bool>('registroBemViver', value);

  bool? get registroAlertasMedicamento =>
      getField<bool>('registroAlertasMedicamento');
  set registroAlertasMedicamento(bool? value) =>
      setField<bool>('registroAlertasMedicamento', value);

  String? get evolucaoBemViver => getField<String>('evolucaoBemViver');
  set evolucaoBemViver(String? value) =>
      setField<String>('evolucaoBemViver', value);

  bool? get acessoAssistente => getField<bool>('acessoAssistente');
  set acessoAssistente(bool? value) =>
      setField<bool>('acessoAssistente', value);

  DateTime? get dataInicio => getField<DateTime>('data_inicio');
  set dataInicio(DateTime? value) => setField<DateTime>('data_inicio', value);

  int? get bipVigente => getField<int>('bipVigente');
  set bipVigente(int? value) => setField<int>('bipVigente', value);

  int? get bipsDisponiveis => getField<int>('bipsDisponiveis');
  set bipsDisponiveis(int? value) => setField<int>('bipsDisponiveis', value);
}
