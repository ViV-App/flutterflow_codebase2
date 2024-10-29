// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeekDateStruct extends BaseStruct {
  WeekDateStruct({
    DateTime? date,
    String? dia,
  })  : _date = date,
        _dia = dia;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "dia" field.
  String? _dia;
  String get dia => _dia ?? '';
  set dia(String? val) => _dia = val;

  bool hasDia() => _dia != null;

  static WeekDateStruct fromMap(Map<String, dynamic> data) => WeekDateStruct(
        date: data['date'] as DateTime?,
        dia: data['dia'] as String?,
      );

  static WeekDateStruct? maybeFromMap(dynamic data) =>
      data is Map ? WeekDateStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'dia': _dia,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'dia': serializeParam(
          _dia,
          ParamType.String,
        ),
      }.withoutNulls;

  static WeekDateStruct fromSerializableMap(Map<String, dynamic> data) =>
      WeekDateStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        dia: deserializeParam(
          data['dia'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WeekDateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WeekDateStruct && date == other.date && dia == other.dia;
  }

  @override
  int get hashCode => const ListEquality().hash([date, dia]);
}

WeekDateStruct createWeekDateStruct({
  DateTime? date,
  String? dia,
}) =>
    WeekDateStruct(
      date: date,
      dia: dia,
    );
