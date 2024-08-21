import '../database.dart';

class RespostasQuestionarioTable
    extends SupabaseTable<RespostasQuestionarioRow> {
  @override
  String get tableName => 'respostas_questionario';

  @override
  RespostasQuestionarioRow createRow(Map<String, dynamic> data) =>
      RespostasQuestionarioRow(data);
}

class RespostasQuestionarioRow extends SupabaseDataRow {
  RespostasQuestionarioRow(super.data);

  @override
  SupabaseTable get table => RespostasQuestionarioTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get paciente => getField<int>('paciente');
  set paciente(int? value) => setField<int>('paciente', value);

  int? get questionario => getField<int>('questionario');
  set questionario(int? value) => setField<int>('questionario', value);

  int? get pergunta => getField<int>('pergunta');
  set pergunta(int? value) => setField<int>('pergunta', value);

  String? get singleTextResponse => getField<String>('single_text_response');
  set singleTextResponse(String? value) =>
      setField<String>('single_text_response', value);

  List<String> get multiTextResponse =>
      getListField<String>('multi_text_response');
  set multiTextResponse(List<String>? value) =>
      setListField<String>('multi_text_response', value);

  int? get ordem => getField<int>('ordem');
  set ordem(int? value) => setField<int>('ordem', value);

  int? get nextQuestion => getField<int>('next_question');
  set nextQuestion(int? value) => setField<int>('next_question', value);
}
