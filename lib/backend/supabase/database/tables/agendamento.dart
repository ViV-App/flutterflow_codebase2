import '../database.dart';

class AgendamentoTable extends SupabaseTable<AgendamentoRow> {
  @override
  String get tableName => 'agendamento';

  @override
  AgendamentoRow createRow(Map<String, dynamic> data) => AgendamentoRow(data);
}

class AgendamentoRow extends SupabaseDataRow {
  AgendamentoRow(super.data);

  @override
  SupabaseTable get table => AgendamentoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get pacienteVinculado => getField<int>('paciente_vinculado');
  set pacienteVinculado(int? value) =>
      setField<int>('paciente_vinculado', value);

  PostgresTime? get horario => getField<PostgresTime>('horario');
  set horario(PostgresTime? value) => setField<PostgresTime>('horario', value);

  DateTime? get datetime => getField<DateTime>('datetime');
  set datetime(DateTime? value) => setField<DateTime>('datetime', value);

  int? get cobranca => getField<int>('cobranca');
  set cobranca(int? value) => setField<int>('cobranca', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get calendlyEventId => getField<String>('calendly_event_id');
  set calendlyEventId(String? value) =>
      setField<String>('calendly_event_id', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);
}
