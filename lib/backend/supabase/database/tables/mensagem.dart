import '../database.dart';

class MensagemTable extends SupabaseTable<MensagemRow> {
  @override
  String get tableName => 'mensagem';

  @override
  MensagemRow createRow(Map<String, dynamic> data) => MensagemRow(data);
}

class MensagemRow extends SupabaseDataRow {
  MensagemRow(super.data);

  @override
  SupabaseTable get table => MensagemTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get chat => getField<int>('chat');
  set chat(int? value) => setField<int>('chat', value);

  String? get sender => getField<String>('sender');
  set sender(String? value) => setField<String>('sender', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);
}
