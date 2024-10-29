import '../database.dart';

class MensagemTable extends SupabaseTable<MensagemRow> {
  @override
  String get tableName => 'mensagem';

  @override
  MensagemRow createRow(Map<String, dynamic> data) => MensagemRow(data);
}

class MensagemRow extends SupabaseDataRow {
  MensagemRow(Map<String, dynamic> data) : super(data);

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

  int? get perguntaFluxo => getField<int>('pergunta_fluxo');
  set perguntaFluxo(int? value) => setField<int>('pergunta_fluxo', value);

  bool? get isPergunta => getField<bool>('is_pergunta');
  set isPergunta(bool? value) => setField<bool>('is_pergunta', value);

  dynamic? get resposta => getField<dynamic>('resposta');
  set resposta(dynamic? value) => setField<dynamic>('resposta', value);
}
