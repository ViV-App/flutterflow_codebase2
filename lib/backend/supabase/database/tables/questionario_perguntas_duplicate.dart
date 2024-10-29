import '../database.dart';

class QuestionarioPerguntasDuplicateTable
    extends SupabaseTable<QuestionarioPerguntasDuplicateRow> {
  @override
  String get tableName => 'questionario_perguntas_duplicate';

  @override
  QuestionarioPerguntasDuplicateRow createRow(Map<String, dynamic> data) =>
      QuestionarioPerguntasDuplicateRow(data);
}

class QuestionarioPerguntasDuplicateRow extends SupabaseDataRow {
  QuestionarioPerguntasDuplicateRow(super.data);

  @override
  SupabaseTable get table => QuestionarioPerguntasDuplicateTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get fluxoReferente => getField<int>('fluxo_referente');
  set fluxoReferente(int? value) => setField<int>('fluxo_referente', value);

  String? get pergunta => getField<String>('pergunta');
  set pergunta(String? value) => setField<String>('pergunta', value);

  bool? get opcoesAtivadas => getField<bool>('opcoes_ativadas');
  set opcoesAtivadas(bool? value) => setField<bool>('opcoes_ativadas', value);

  List<dynamic> get opcoes => getListField<dynamic>('opcoes');
  set opcoes(List<dynamic>? value) => setListField<dynamic>('opcoes', value);

  int? get ordem => getField<int>('ordem');
  set ordem(int? value) => setField<int>('ordem', value);

  bool? get multiplasEscolhas => getField<bool>('multiplas_escolhas');
  set multiplasEscolhas(bool? value) =>
      setField<bool>('multiplas_escolhas', value);

  String? get answerTyype => getField<String>('answer_tyype');
  set answerTyype(String? value) => setField<String>('answer_tyype', value);
}
