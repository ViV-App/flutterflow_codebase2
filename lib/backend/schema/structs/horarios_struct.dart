// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HorariosStruct extends BaseStruct {
  HorariosStruct({
    DateTime? horario,
  }) : _horario = horario;

  // "horario" field.
  DateTime? _horario;
  DateTime? get horario => _horario;
  set horario(DateTime? val) => _horario = val;

  bool hasHorario() => _horario != null;

  static HorariosStruct fromMap(Map<String, dynamic> data) => HorariosStruct(
        horario: data['horario'] as DateTime?,
      );

  static HorariosStruct? maybeFromMap(dynamic data) =>
      data is Map ? HorariosStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'horario': _horario,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'horario': serializeParam(
          _horario,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static HorariosStruct fromSerializableMap(Map<String, dynamic> data) =>
      HorariosStruct(
        horario: deserializeParam(
          data['horario'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'HorariosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HorariosStruct && horario == other.horario;
  }

  @override
  int get hashCode => const ListEquality().hash([horario]);
}

HorariosStruct createHorariosStruct({
  DateTime? horario,
}) =>
    HorariosStruct(
      horario: horario,
    );
