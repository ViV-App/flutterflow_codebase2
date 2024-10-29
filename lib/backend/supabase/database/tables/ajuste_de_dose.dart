import '../database.dart';

class AjusteDeDoseTable extends SupabaseTable<AjusteDeDoseRow> {
  @override
  String get tableName => 'ajuste_de_dose';

  @override
  AjusteDeDoseRow createRow(Map<String, dynamic> data) => AjusteDeDoseRow(data);
}

class AjusteDeDoseRow extends SupabaseDataRow {
  AjusteDeDoseRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AjusteDeDoseTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get paciente => getField<int>('paciente');
  set paciente(int? value) => setField<int>('paciente', value);

  String? get propostaT => getField<String>('propostaT');
  set propostaT(String? value) => setField<String>('propostaT', value);

  String? get observacoes => getField<String>('observacoes');
  set observacoes(String? value) => setField<String>('observacoes', value);

  String? get profissionalUploader => getField<String>('profissionalUploader');
  set profissionalUploader(String? value) =>
      setField<String>('profissionalUploader', value);

  String? get planoT => getField<String>('planoT');
  set planoT(String? value) => setField<String>('planoT', value);
}
