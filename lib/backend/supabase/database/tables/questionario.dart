import '../database.dart';

class QuestionarioTable extends SupabaseTable<QuestionarioRow> {
  @override
  String get tableName => 'questionario';

  @override
  QuestionarioRow createRow(Map<String, dynamic> data) => QuestionarioRow(data);
}

class QuestionarioRow extends SupabaseDataRow {
  QuestionarioRow(super.data);

  @override
  SupabaseTable get table => QuestionarioTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get categoria => getField<String>('categoria');
  set categoria(String? value) => setField<String>('categoria', value);

  String? get proposito => getField<String>('proposito');
  set proposito(String? value) => setField<String>('proposito', value);
}
