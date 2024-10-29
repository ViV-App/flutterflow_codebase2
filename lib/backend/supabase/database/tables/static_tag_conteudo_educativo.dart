import '../database.dart';

class StaticTagConteudoEducativoTable
    extends SupabaseTable<StaticTagConteudoEducativoRow> {
  @override
  String get tableName => 'static_tag_conteudo_educativo';

  @override
  StaticTagConteudoEducativoRow createRow(Map<String, dynamic> data) =>
      StaticTagConteudoEducativoRow(data);
}

class StaticTagConteudoEducativoRow extends SupabaseDataRow {
  StaticTagConteudoEducativoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StaticTagConteudoEducativoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get titulo => getField<String>('titulo');
  set titulo(String? value) => setField<String>('titulo', value);
}
