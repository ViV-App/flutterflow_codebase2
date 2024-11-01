import '../database.dart';

class StatusPacientTable extends SupabaseTable<StatusPacientRow> {
  @override
  String get tableName => 'status_pacient';

  @override
  StatusPacientRow createRow(Map<String, dynamic> data) =>
      StatusPacientRow(data);
}

class StatusPacientRow extends SupabaseDataRow {
  StatusPacientRow(super.data);

  @override
  SupabaseTable get table => StatusPacientTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get paciente => getField<int>('paciente');
  set paciente(int? value) => setField<int>('paciente', value);

  String? get processo => getField<String>('processo');
  set processo(String? value) => setField<String>('processo', value);

  String? get estagio => getField<String>('estagio');
  set estagio(String? value) => setField<String>('estagio', value);

  List<dynamic> get historico => getListField<dynamic>('historico');
  set historico(List<dynamic>? value) =>
      setListField<dynamic>('historico', value);
}
