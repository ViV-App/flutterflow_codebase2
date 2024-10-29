import '../database.dart';

class PlanoTerapeuticoTable extends SupabaseTable<PlanoTerapeuticoRow> {
  @override
  String get tableName => 'plano_terapeutico';

  @override
  PlanoTerapeuticoRow createRow(Map<String, dynamic> data) =>
      PlanoTerapeuticoRow(data);
}

class PlanoTerapeuticoRow extends SupabaseDataRow {
  PlanoTerapeuticoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PlanoTerapeuticoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get paciente => getField<int>('paciente');
  set paciente(int? value) => setField<int>('paciente', value);

  String? get file => getField<String>('file');
  set file(String? value) => setField<String>('file', value);

  String? get profissionalUploader => getField<String>('profissionalUploader');
  set profissionalUploader(String? value) =>
      setField<String>('profissionalUploader', value);

  String? get observacoes => getField<String>('observacoes');
  set observacoes(String? value) => setField<String>('observacoes', value);

  String? get receita => getField<String>('receita');
  set receita(String? value) => setField<String>('receita', value);

  String? get dosagem => getField<String>('dosagem');
  set dosagem(String? value) => setField<String>('dosagem', value);
}
