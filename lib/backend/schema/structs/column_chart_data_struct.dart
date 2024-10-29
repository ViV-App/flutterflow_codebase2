// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ColumnChartDataStruct extends BaseStruct {
  ColumnChartDataStruct({
    String? sintoma,
    int? count,
  })  : _sintoma = sintoma,
        _count = count;

  // "sintoma" field.
  String? _sintoma;
  String get sintoma => _sintoma ?? '';
  set sintoma(String? val) => _sintoma = val;

  bool hasSintoma() => _sintoma != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  static ColumnChartDataStruct fromMap(Map<String, dynamic> data) =>
      ColumnChartDataStruct(
        sintoma: data['sintoma'] as String?,
        count: castToType<int>(data['count']),
      );

  static ColumnChartDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ColumnChartDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'sintoma': _sintoma,
        'count': _count,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'sintoma': serializeParam(
          _sintoma,
          ParamType.String,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
      }.withoutNulls;

  static ColumnChartDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ColumnChartDataStruct(
        sintoma: deserializeParam(
          data['sintoma'],
          ParamType.String,
          false,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ColumnChartDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ColumnChartDataStruct &&
        sintoma == other.sintoma &&
        count == other.count;
  }

  @override
  int get hashCode => const ListEquality().hash([sintoma, count]);
}

ColumnChartDataStruct createColumnChartDataStruct({
  String? sintoma,
  int? count,
}) =>
    ColumnChartDataStruct(
      sintoma: sintoma,
      count: count,
    );
