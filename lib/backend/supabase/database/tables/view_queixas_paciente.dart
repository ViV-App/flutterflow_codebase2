import '../database.dart';

class ViewQueixasPacienteTable extends SupabaseTable<ViewQueixasPacienteRow> {
  @override
  String get tableName => 'view_queixas_paciente';

  @override
  ViewQueixasPacienteRow createRow(Map<String, dynamic> data) =>
      ViewQueixasPacienteRow(data);
}

class ViewQueixasPacienteRow extends SupabaseDataRow {
  ViewQueixasPacienteRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewQueixasPacienteTable();

  int? get queixaId => getField<int>('queixa_id');
  set queixaId(int? value) => setField<int>('queixa_id', value);

  String? get queixaNome => getField<String>('queixa_nome');
  set queixaNome(String? value) => setField<String>('queixa_nome', value);

  String? get queixaLogo => getField<String>('queixa_logo');
  set queixaLogo(String? value) => setField<String>('queixa_logo', value);

  List<dynamic> get queixaPerguntas =>
      getListField<dynamic>('queixa_perguntas');
  set queixaPerguntas(List<dynamic>? value) =>
      setListField<dynamic>('queixa_perguntas', value);

  String? get queixaDescritivo => getField<String>('queixa_descritivo');
  set queixaDescritivo(String? value) =>
      setField<String>('queixa_descritivo', value);

  int? get pacienteId => getField<int>('paciente_id');
  set pacienteId(int? value) => setField<int>('paciente_id', value);

  String? get pacienteNome => getField<String>('paciente_nome');
  set pacienteNome(String? value) => setField<String>('paciente_nome', value);
}
