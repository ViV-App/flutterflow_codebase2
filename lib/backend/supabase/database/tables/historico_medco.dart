import '../database.dart';

class HistoricoMedcoTable extends SupabaseTable<HistoricoMedcoRow> {
  @override
  String get tableName => 'historico_medco';

  @override
  HistoricoMedcoRow createRow(Map<String, dynamic> data) =>
      HistoricoMedcoRow(data);
}

class HistoricoMedcoRow extends SupabaseDataRow {
  HistoricoMedcoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HistoricoMedcoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get paciente => getField<int>('paciente');
  set paciente(int? value) => setField<int>('paciente', value);

  List<dynamic> get respostas => getListField<dynamic>('respostas');
  set respostas(List<dynamic>? value) =>
      setListField<dynamic>('respostas', value);
}
