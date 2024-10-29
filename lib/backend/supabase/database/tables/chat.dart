import '../database.dart';

class ChatTable extends SupabaseTable<ChatRow> {
  @override
  String get tableName => 'chat';

  @override
  ChatRow createRow(Map<String, dynamic> data) => ChatRow(data);
}

class ChatRow extends SupabaseDataRow {
  ChatRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get paciente => getField<int>('paciente');
  set paciente(int? value) => setField<int>('paciente', value);

  String? get threadId => getField<String>('thread_id');
  set threadId(String? value) => setField<String>('thread_id', value);

  List<String> get threadsHistory => getListField<String>('threads_history');
  set threadsHistory(List<String>? value) =>
      setListField<String>('threads_history', value);
}
