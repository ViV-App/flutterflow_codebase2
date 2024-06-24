// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgendaStruct extends BaseStruct {
  AgendaStruct({
    int? medicamentoId,
    String? medicamentoNome,
    int? prescricaoId,
    String? turno,
    bool? consumido,
    int? consumoId,
    String? dateStart,
    String? dateEnd,
    String? horario,
    DateTime? time,
    int? first,
    String? categoria,
    String? formaDose,
    int? posologia,
    String? horarioString,
  })  : _medicamentoId = medicamentoId,
        _medicamentoNome = medicamentoNome,
        _prescricaoId = prescricaoId,
        _turno = turno,
        _consumido = consumido,
        _consumoId = consumoId,
        _dateStart = dateStart,
        _dateEnd = dateEnd,
        _horario = horario,
        _time = time,
        _first = first,
        _categoria = categoria,
        _formaDose = formaDose,
        _posologia = posologia,
        _horarioString = horarioString;

  // "medicamento_id" field.
  int? _medicamentoId;
  int get medicamentoId => _medicamentoId ?? 0;
  set medicamentoId(int? val) => _medicamentoId = val;

  void incrementMedicamentoId(int amount) =>
      medicamentoId = medicamentoId + amount;

  bool hasMedicamentoId() => _medicamentoId != null;

  // "medicamento_nome" field.
  String? _medicamentoNome;
  String get medicamentoNome => _medicamentoNome ?? '';
  set medicamentoNome(String? val) => _medicamentoNome = val;

  bool hasMedicamentoNome() => _medicamentoNome != null;

  // "prescricao_id" field.
  int? _prescricaoId;
  int get prescricaoId => _prescricaoId ?? 0;
  set prescricaoId(int? val) => _prescricaoId = val;

  void incrementPrescricaoId(int amount) =>
      prescricaoId = prescricaoId + amount;

  bool hasPrescricaoId() => _prescricaoId != null;

  // "turno" field.
  String? _turno;
  String get turno => _turno ?? '';
  set turno(String? val) => _turno = val;

  bool hasTurno() => _turno != null;

  // "consumido" field.
  bool? _consumido;
  bool get consumido => _consumido ?? false;
  set consumido(bool? val) => _consumido = val;

  bool hasConsumido() => _consumido != null;

  // "consumo_id" field.
  int? _consumoId;
  int get consumoId => _consumoId ?? 0;
  set consumoId(int? val) => _consumoId = val;

  void incrementConsumoId(int amount) => consumoId = consumoId + amount;

  bool hasConsumoId() => _consumoId != null;

  // "date_start" field.
  String? _dateStart;
  String get dateStart => _dateStart ?? '';
  set dateStart(String? val) => _dateStart = val;

  bool hasDateStart() => _dateStart != null;

  // "date_end" field.
  String? _dateEnd;
  String get dateEnd => _dateEnd ?? '';
  set dateEnd(String? val) => _dateEnd = val;

  bool hasDateEnd() => _dateEnd != null;

  // "horario" field.
  String? _horario;
  String get horario => _horario ?? '';
  set horario(String? val) => _horario = val;

  bool hasHorario() => _horario != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? val) => _time = val;

  bool hasTime() => _time != null;

  // "first" field.
  int? _first;
  int get first => _first ?? 0;
  set first(int? val) => _first = val;

  void incrementFirst(int amount) => first = first + amount;

  bool hasFirst() => _first != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  set categoria(String? val) => _categoria = val;

  bool hasCategoria() => _categoria != null;

  // "forma_dose" field.
  String? _formaDose;
  String get formaDose => _formaDose ?? '';
  set formaDose(String? val) => _formaDose = val;

  bool hasFormaDose() => _formaDose != null;

  // "posologia" field.
  int? _posologia;
  int get posologia => _posologia ?? 0;
  set posologia(int? val) => _posologia = val;

  void incrementPosologia(int amount) => posologia = posologia + amount;

  bool hasPosologia() => _posologia != null;

  // "horario_string" field.
  String? _horarioString;
  String get horarioString => _horarioString ?? '';
  set horarioString(String? val) => _horarioString = val;

  bool hasHorarioString() => _horarioString != null;

  static AgendaStruct fromMap(Map<String, dynamic> data) => AgendaStruct(
        medicamentoId: castToType<int>(data['medicamento_id']),
        medicamentoNome: data['medicamento_nome'] as String?,
        prescricaoId: castToType<int>(data['prescricao_id']),
        turno: data['turno'] as String?,
        consumido: data['consumido'] as bool?,
        consumoId: castToType<int>(data['consumo_id']),
        dateStart: data['date_start'] as String?,
        dateEnd: data['date_end'] as String?,
        horario: data['horario'] as String?,
        time: data['time'] as DateTime?,
        first: castToType<int>(data['first']),
        categoria: data['categoria'] as String?,
        formaDose: data['forma_dose'] as String?,
        posologia: castToType<int>(data['posologia']),
        horarioString: data['horario_string'] as String?,
      );

  static AgendaStruct? maybeFromMap(dynamic data) =>
      data is Map ? AgendaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'medicamento_id': _medicamentoId,
        'medicamento_nome': _medicamentoNome,
        'prescricao_id': _prescricaoId,
        'turno': _turno,
        'consumido': _consumido,
        'consumo_id': _consumoId,
        'date_start': _dateStart,
        'date_end': _dateEnd,
        'horario': _horario,
        'time': _time,
        'first': _first,
        'categoria': _categoria,
        'forma_dose': _formaDose,
        'posologia': _posologia,
        'horario_string': _horarioString,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'medicamento_id': serializeParam(
          _medicamentoId,
          ParamType.int,
        ),
        'medicamento_nome': serializeParam(
          _medicamentoNome,
          ParamType.String,
        ),
        'prescricao_id': serializeParam(
          _prescricaoId,
          ParamType.int,
        ),
        'turno': serializeParam(
          _turno,
          ParamType.String,
        ),
        'consumido': serializeParam(
          _consumido,
          ParamType.bool,
        ),
        'consumo_id': serializeParam(
          _consumoId,
          ParamType.int,
        ),
        'date_start': serializeParam(
          _dateStart,
          ParamType.String,
        ),
        'date_end': serializeParam(
          _dateEnd,
          ParamType.String,
        ),
        'horario': serializeParam(
          _horario,
          ParamType.String,
        ),
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
        'first': serializeParam(
          _first,
          ParamType.int,
        ),
        'categoria': serializeParam(
          _categoria,
          ParamType.String,
        ),
        'forma_dose': serializeParam(
          _formaDose,
          ParamType.String,
        ),
        'posologia': serializeParam(
          _posologia,
          ParamType.int,
        ),
        'horario_string': serializeParam(
          _horarioString,
          ParamType.String,
        ),
      }.withoutNulls;

  static AgendaStruct fromSerializableMap(Map<String, dynamic> data) =>
      AgendaStruct(
        medicamentoId: deserializeParam(
          data['medicamento_id'],
          ParamType.int,
          false,
        ),
        medicamentoNome: deserializeParam(
          data['medicamento_nome'],
          ParamType.String,
          false,
        ),
        prescricaoId: deserializeParam(
          data['prescricao_id'],
          ParamType.int,
          false,
        ),
        turno: deserializeParam(
          data['turno'],
          ParamType.String,
          false,
        ),
        consumido: deserializeParam(
          data['consumido'],
          ParamType.bool,
          false,
        ),
        consumoId: deserializeParam(
          data['consumo_id'],
          ParamType.int,
          false,
        ),
        dateStart: deserializeParam(
          data['date_start'],
          ParamType.String,
          false,
        ),
        dateEnd: deserializeParam(
          data['date_end'],
          ParamType.String,
          false,
        ),
        horario: deserializeParam(
          data['horario'],
          ParamType.String,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
        first: deserializeParam(
          data['first'],
          ParamType.int,
          false,
        ),
        categoria: deserializeParam(
          data['categoria'],
          ParamType.String,
          false,
        ),
        formaDose: deserializeParam(
          data['forma_dose'],
          ParamType.String,
          false,
        ),
        posologia: deserializeParam(
          data['posologia'],
          ParamType.int,
          false,
        ),
        horarioString: deserializeParam(
          data['horario_string'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AgendaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AgendaStruct &&
        medicamentoId == other.medicamentoId &&
        medicamentoNome == other.medicamentoNome &&
        prescricaoId == other.prescricaoId &&
        turno == other.turno &&
        consumido == other.consumido &&
        consumoId == other.consumoId &&
        dateStart == other.dateStart &&
        dateEnd == other.dateEnd &&
        horario == other.horario &&
        time == other.time &&
        first == other.first &&
        categoria == other.categoria &&
        formaDose == other.formaDose &&
        posologia == other.posologia &&
        horarioString == other.horarioString;
  }

  @override
  int get hashCode => const ListEquality().hash([
        medicamentoId,
        medicamentoNome,
        prescricaoId,
        turno,
        consumido,
        consumoId,
        dateStart,
        dateEnd,
        horario,
        time,
        first,
        categoria,
        formaDose,
        posologia,
        horarioString
      ]);
}

AgendaStruct createAgendaStruct({
  int? medicamentoId,
  String? medicamentoNome,
  int? prescricaoId,
  String? turno,
  bool? consumido,
  int? consumoId,
  String? dateStart,
  String? dateEnd,
  String? horario,
  DateTime? time,
  int? first,
  String? categoria,
  String? formaDose,
  int? posologia,
  String? horarioString,
}) =>
    AgendaStruct(
      medicamentoId: medicamentoId,
      medicamentoNome: medicamentoNome,
      prescricaoId: prescricaoId,
      turno: turno,
      consumido: consumido,
      consumoId: consumoId,
      dateStart: dateStart,
      dateEnd: dateEnd,
      horario: horario,
      time: time,
      first: first,
      categoria: categoria,
      formaDose: formaDose,
      posologia: posologia,
      horarioString: horarioString,
    );
