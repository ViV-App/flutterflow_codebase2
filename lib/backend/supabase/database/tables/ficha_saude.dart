import '../database.dart';

class FichaSaudeTable extends SupabaseTable<FichaSaudeRow> {
  @override
  String get tableName => 'ficha_saude';

  @override
  FichaSaudeRow createRow(Map<String, dynamic> data) => FichaSaudeRow(data);
}

class FichaSaudeRow extends SupabaseDataRow {
  FichaSaudeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FichaSaudeTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get medicoPrescritor => getField<int>('medico_prescritor');
  set medicoPrescritor(int? value) => setField<int>('medico_prescritor', value);

  DateTime? get dataPrescricao => getField<DateTime>('data_prescricao');
  set dataPrescricao(DateTime? value) =>
      setField<DateTime>('data_prescricao', value);

  double? get altura => getField<double>('altura');
  set altura(double? value) => setField<double>('altura', value);

  double? get peso => getField<double>('peso');
  set peso(double? value) => setField<double>('peso', value);
}
