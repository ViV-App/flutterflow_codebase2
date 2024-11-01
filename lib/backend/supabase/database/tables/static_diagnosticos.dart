import '../database.dart';

class StaticDiagnosticosTable extends SupabaseTable<StaticDiagnosticosRow> {
  @override
  String get tableName => 'static_diagnosticos';

  @override
  StaticDiagnosticosRow createRow(Map<String, dynamic> data) =>
      StaticDiagnosticosRow(data);
}

class StaticDiagnosticosRow extends SupabaseDataRow {
  StaticDiagnosticosRow(super.data);

  @override
  SupabaseTable get table => StaticDiagnosticosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  List<dynamic> get perguntas => getListField<dynamic>('perguntas');
  set perguntas(List<dynamic>? value) =>
      setListField<dynamic>('perguntas', value);
}
