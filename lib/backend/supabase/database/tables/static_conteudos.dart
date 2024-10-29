import '../database.dart';

class StaticConteudosTable extends SupabaseTable<StaticConteudosRow> {
  @override
  String get tableName => 'static_conteudos';

  @override
  StaticConteudosRow createRow(Map<String, dynamic> data) =>
      StaticConteudosRow(data);
}

class StaticConteudosRow extends SupabaseDataRow {
  StaticConteudosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StaticConteudosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get titulo => getField<String>('titulo');
  set titulo(String? value) => setField<String>('titulo', value);

  String? get descricaoCurta => getField<String>('descricao_curta');
  set descricaoCurta(String? value) =>
      setField<String>('descricao_curta', value);

  String? get tag => getField<String>('tag');
  set tag(String? value) => setField<String>('tag', value);

  bool? get ativo => getField<bool>('ativo');
  set ativo(bool? value) => setField<bool>('ativo', value);

  String? get capa => getField<String>('capa');
  set capa(String? value) => setField<String>('capa', value);

  int? get tempoLeitura => getField<int>('tempo_leitura');
  set tempoLeitura(int? value) => setField<int>('tempo_leitura', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);
}
