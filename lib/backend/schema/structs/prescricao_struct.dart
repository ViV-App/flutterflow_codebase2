// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrescricaoStruct extends BaseStruct {
  PrescricaoStruct({
    String? categoria,
    int? remedio,
    int? concentracao,
    List<HorariosStruct>? timeslots,
    List<DateTime>? horarios,
    int? volumeFrasco,
    String? remedNome,
    int? duracaoDias,
  })  : _categoria = categoria,
        _remedio = remedio,
        _concentracao = concentracao,
        _timeslots = timeslots,
        _horarios = horarios,
        _volumeFrasco = volumeFrasco,
        _remedNome = remedNome,
        _duracaoDias = duracaoDias;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  set categoria(String? val) => _categoria = val;

  bool hasCategoria() => _categoria != null;

  // "remedio" field.
  int? _remedio;
  int get remedio => _remedio ?? 0;
  set remedio(int? val) => _remedio = val;

  void incrementRemedio(int amount) => remedio = remedio + amount;

  bool hasRemedio() => _remedio != null;

  // "concentracao" field.
  int? _concentracao;
  int get concentracao => _concentracao ?? 0;
  set concentracao(int? val) => _concentracao = val;

  void incrementConcentracao(int amount) =>
      concentracao = concentracao + amount;

  bool hasConcentracao() => _concentracao != null;

  // "timeslots" field.
  List<HorariosStruct>? _timeslots;
  List<HorariosStruct> get timeslots => _timeslots ?? const [];
  set timeslots(List<HorariosStruct>? val) => _timeslots = val;

  void updateTimeslots(Function(List<HorariosStruct>) updateFn) {
    updateFn(timeslots ??= []);
  }

  bool hasTimeslots() => _timeslots != null;

  // "horarios" field.
  List<DateTime>? _horarios;
  List<DateTime> get horarios => _horarios ?? const [];
  set horarios(List<DateTime>? val) => _horarios = val;

  void updateHorarios(Function(List<DateTime>) updateFn) {
    updateFn(horarios ??= []);
  }

  bool hasHorarios() => _horarios != null;

  // "volume_frasco" field.
  int? _volumeFrasco;
  int get volumeFrasco => _volumeFrasco ?? 0;
  set volumeFrasco(int? val) => _volumeFrasco = val;

  void incrementVolumeFrasco(int amount) =>
      volumeFrasco = volumeFrasco + amount;

  bool hasVolumeFrasco() => _volumeFrasco != null;

  // "remed_nome" field.
  String? _remedNome;
  String get remedNome => _remedNome ?? '';
  set remedNome(String? val) => _remedNome = val;

  bool hasRemedNome() => _remedNome != null;

  // "duracao_dias" field.
  int? _duracaoDias;
  int get duracaoDias => _duracaoDias ?? 0;
  set duracaoDias(int? val) => _duracaoDias = val;

  void incrementDuracaoDias(int amount) => duracaoDias = duracaoDias + amount;

  bool hasDuracaoDias() => _duracaoDias != null;

  static PrescricaoStruct fromMap(Map<String, dynamic> data) =>
      PrescricaoStruct(
        categoria: data['categoria'] as String?,
        remedio: castToType<int>(data['remedio']),
        concentracao: castToType<int>(data['concentracao']),
        timeslots: getStructList(
          data['timeslots'],
          HorariosStruct.fromMap,
        ),
        horarios: getDataList(data['horarios']),
        volumeFrasco: castToType<int>(data['volume_frasco']),
        remedNome: data['remed_nome'] as String?,
        duracaoDias: castToType<int>(data['duracao_dias']),
      );

  static PrescricaoStruct? maybeFromMap(dynamic data) => data is Map
      ? PrescricaoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'categoria': _categoria,
        'remedio': _remedio,
        'concentracao': _concentracao,
        'timeslots': _timeslots?.map((e) => e.toMap()).toList(),
        'horarios': _horarios,
        'volume_frasco': _volumeFrasco,
        'remed_nome': _remedNome,
        'duracao_dias': _duracaoDias,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'categoria': serializeParam(
          _categoria,
          ParamType.String,
        ),
        'remedio': serializeParam(
          _remedio,
          ParamType.int,
        ),
        'concentracao': serializeParam(
          _concentracao,
          ParamType.int,
        ),
        'timeslots': serializeParam(
          _timeslots,
          ParamType.DataStruct,
          isList: true,
        ),
        'horarios': serializeParam(
          _horarios,
          ParamType.DateTime,
          isList: true,
        ),
        'volume_frasco': serializeParam(
          _volumeFrasco,
          ParamType.int,
        ),
        'remed_nome': serializeParam(
          _remedNome,
          ParamType.String,
        ),
        'duracao_dias': serializeParam(
          _duracaoDias,
          ParamType.int,
        ),
      }.withoutNulls;

  static PrescricaoStruct fromSerializableMap(Map<String, dynamic> data) =>
      PrescricaoStruct(
        categoria: deserializeParam(
          data['categoria'],
          ParamType.String,
          false,
        ),
        remedio: deserializeParam(
          data['remedio'],
          ParamType.int,
          false,
        ),
        concentracao: deserializeParam(
          data['concentracao'],
          ParamType.int,
          false,
        ),
        timeslots: deserializeStructParam<HorariosStruct>(
          data['timeslots'],
          ParamType.DataStruct,
          true,
          structBuilder: HorariosStruct.fromSerializableMap,
        ),
        horarios: deserializeParam<DateTime>(
          data['horarios'],
          ParamType.DateTime,
          true,
        ),
        volumeFrasco: deserializeParam(
          data['volume_frasco'],
          ParamType.int,
          false,
        ),
        remedNome: deserializeParam(
          data['remed_nome'],
          ParamType.String,
          false,
        ),
        duracaoDias: deserializeParam(
          data['duracao_dias'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PrescricaoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PrescricaoStruct &&
        categoria == other.categoria &&
        remedio == other.remedio &&
        concentracao == other.concentracao &&
        listEquality.equals(timeslots, other.timeslots) &&
        listEquality.equals(horarios, other.horarios) &&
        volumeFrasco == other.volumeFrasco &&
        remedNome == other.remedNome &&
        duracaoDias == other.duracaoDias;
  }

  @override
  int get hashCode => const ListEquality().hash([
        categoria,
        remedio,
        concentracao,
        timeslots,
        horarios,
        volumeFrasco,
        remedNome,
        duracaoDias
      ]);
}

PrescricaoStruct createPrescricaoStruct({
  String? categoria,
  int? remedio,
  int? concentracao,
  int? volumeFrasco,
  String? remedNome,
  int? duracaoDias,
}) =>
    PrescricaoStruct(
      categoria: categoria,
      remedio: remedio,
      concentracao: concentracao,
      volumeFrasco: volumeFrasco,
      remedNome: remedNome,
      duracaoDias: duracaoDias,
    );
