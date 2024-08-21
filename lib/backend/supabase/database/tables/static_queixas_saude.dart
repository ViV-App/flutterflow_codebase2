import '../database.dart';

class StaticQueixasSaudeTable extends SupabaseTable<StaticQueixasSaudeRow> {
  @override
  String get tableName => 'static_queixas_saude';

  @override
  StaticQueixasSaudeRow createRow(Map<String, dynamic> data) =>
      StaticQueixasSaudeRow(data);
}

class StaticQueixasSaudeRow extends SupabaseDataRow {
  StaticQueixasSaudeRow(super.data);

  @override
  SupabaseTable get table => StaticQueixasSaudeTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get logo => getField<String>('logo');
  set logo(String? value) => setField<String>('logo', value);

  List<dynamic> get perguntas => getListField<dynamic>('perguntas');
  set perguntas(List<dynamic>? value) =>
      setListField<dynamic>('perguntas', value);

  String? get descritivo => getField<String>('descritivo');
  set descritivo(String? value) => setField<String>('descritivo', value);
}
