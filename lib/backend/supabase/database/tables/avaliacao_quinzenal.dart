import '../database.dart';

class AvaliacaoQuinzenalTable extends SupabaseTable<AvaliacaoQuinzenalRow> {
  @override
  String get tableName => 'avaliacao quinzenal';

  @override
  AvaliacaoQuinzenalRow createRow(Map<String, dynamic> data) =>
      AvaliacaoQuinzenalRow(data);
}

class AvaliacaoQuinzenalRow extends SupabaseDataRow {
  AvaliacaoQuinzenalRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AvaliacaoQuinzenalTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get paciente => getField<int>('paciente');
  set paciente(int? value) => setField<int>('paciente', value);

  int? get atividadesIntensas => getField<int>('atividades_intensas');
  set atividadesIntensas(int? value) =>
      setField<int>('atividades_intensas', value);

  int? get atividadesModeradas => getField<int>('atividades_moderadas');
  set atividadesModeradas(int? value) =>
      setField<int>('atividades_moderadas', value);

  int? get atividadesLeves => getField<int>('atividades_leves');
  set atividadesLeves(int? value) => setField<int>('atividades_leves', value);

  int? get limitacaoEmAtividades => getField<int>('limitacao_em_atividades');
  set limitacaoEmAtividades(int? value) =>
      setField<int>('limitacao_em_atividades', value);

  int? get limitacoesSociais => getField<int>('limitacoes_sociais');
  set limitacoesSociais(int? value) =>
      setField<int>('limitacoes_sociais', value);

  int? get doresNoCorpo => getField<int>('dores_no_corpo');
  set doresNoCorpo(int? value) => setField<int>('dores_no_corpo', value);

  int? get impactoDaDor => getField<int>('impacto_da_dor');
  set impactoDaDor(int? value) => setField<int>('impacto_da_dor', value);

  int? get mudancasEmocionais => getField<int>('mudancas_emocionais');
  set mudancasEmocionais(int? value) =>
      setField<int>('mudancas_emocionais', value);

  int? get energia => getField<int>('energia');
  set energia(int? value) => setField<int>('energia', value);
}
