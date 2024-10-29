import '../database.dart';

class CobrancaTable extends SupabaseTable<CobrancaRow> {
  @override
  String get tableName => 'cobranca';

  @override
  CobrancaRow createRow(Map<String, dynamic> data) => CobrancaRow(data);
}

class CobrancaRow extends SupabaseDataRow {
  CobrancaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CobrancaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);

  DateTime? get vencimento => getField<DateTime>('vencimento');
  set vencimento(DateTime? value) => setField<DateTime>('vencimento', value);

  String? get product => getField<String>('product');
  set product(String? value) => setField<String>('product', value);

  int? get paciente => getField<int>('paciente');
  set paciente(int? value) => setField<int>('paciente', value);

  double? get valor => getField<double>('valor');
  set valor(double? value) => setField<double>('valor', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);
}
