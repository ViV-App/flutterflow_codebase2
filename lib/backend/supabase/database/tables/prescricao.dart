import '../database.dart';

class PrescricaoTable extends SupabaseTable<PrescricaoRow> {
  @override
  String get tableName => 'prescricao';

  @override
  PrescricaoRow createRow(Map<String, dynamic> data) => PrescricaoRow(data);
}

class PrescricaoRow extends SupabaseDataRow {
  PrescricaoRow(super.data);

  @override
  SupabaseTable get table => PrescricaoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get medicamento => getField<int>('medicamento');
  set medicamento(int? value) => setField<int>('medicamento', value);

  String? get formaDose => getField<String>('forma_dose');
  set formaDose(String? value) => setField<String>('forma_dose', value);

  int? get duracaoDias => getField<int>('duracao_dias');
  set duracaoDias(int? value) => setField<int>('duracao_dias', value);

  int? get concentracao => getField<int>('concentracao');
  set concentracao(int? value) => setField<int>('concentracao', value);

  DateTime? get dateStart => getField<DateTime>('date_start');
  set dateStart(DateTime? value) => setField<DateTime>('date_start', value);

  DateTime? get dateEnd => getField<DateTime>('date_end');
  set dateEnd(DateTime? value) => setField<DateTime>('date_end', value);

  List<DateTime> get horarios => getListField<DateTime>('horarios');
  set horarios(List<DateTime>? value) =>
      setListField<DateTime>('horarios', value);

  int? get paciente => getField<int>('paciente');
  set paciente(int? value) => setField<int>('paciente', value);

  int? get posologia => getField<int>('posologia');
  set posologia(int? value) => setField<int>('posologia', value);

  bool? get continuo => getField<bool>('continuo');
  set continuo(bool? value) => setField<bool>('continuo', value);

  List<dynamic> get doses => getListField<dynamic>('doses');
  set doses(List<dynamic>? value) => setListField<dynamic>('doses', value);
}
