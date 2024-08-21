import '../database.dart';

class RespostaQuestionarioTable extends SupabaseTable<RespostaQuestionarioRow> {
  @override
  String get tableName => 'resposta_questionario';

  @override
  RespostaQuestionarioRow createRow(Map<String, dynamic> data) =>
      RespostaQuestionarioRow(data);
}

class RespostaQuestionarioRow extends SupabaseDataRow {
  RespostaQuestionarioRow(super.data);

  @override
  SupabaseTable get table => RespostaQuestionarioTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get paciente => getField<int>('paciente');
  set paciente(int? value) => setField<int>('paciente', value);

  int? get questionario => getField<int>('questionario');
  set questionario(int? value) => setField<int>('questionario', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  List<dynamic> get respostas => getListField<dynamic>('respostas');
  set respostas(List<dynamic>? value) =>
      setListField<dynamic>('respostas', value);
}
