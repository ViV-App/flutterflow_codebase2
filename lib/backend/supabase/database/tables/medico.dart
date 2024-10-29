import '../database.dart';

class MedicoTable extends SupabaseTable<MedicoRow> {
  @override
  String get tableName => 'medico';

  @override
  MedicoRow createRow(Map<String, dynamic> data) => MedicoRow(data);
}

class MedicoRow extends SupabaseDataRow {
  MedicoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MedicoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get crm => getField<String>('crm');
  set crm(String? value) => setField<String>('crm', value);

  String? get uf => getField<String>('uf');
  set uf(String? value) => setField<String>('uf', value);
}
