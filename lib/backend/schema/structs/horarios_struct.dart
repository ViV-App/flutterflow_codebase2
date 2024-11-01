// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HorariosStruct extends BaseStruct {
  HorariosStruct({
    DateTime? horario,
    double? dosagem,
    String? medida,
  })  : _horario = horario,
        _dosagem = dosagem,
        _medida = medida;

  // "horario" field.
  DateTime? _horario;
  DateTime? get horario => _horario;
  set horario(DateTime? val) => _horario = val;

  bool hasHorario() => _horario != null;

  // "dosagem" field.
  double? _dosagem;
  double get dosagem => _dosagem ?? 0.0;
  set dosagem(double? val) => _dosagem = val;

  void incrementDosagem(double amount) => dosagem = dosagem + amount;

  bool hasDosagem() => _dosagem != null;

  // "medida" field.
  String? _medida;
  String get medida => _medida ?? '';
  set medida(String? val) => _medida = val;

  bool hasMedida() => _medida != null;

  static HorariosStruct fromMap(Map<String, dynamic> data) => HorariosStruct(
        horario: data['horario'] as DateTime?,
        dosagem: castToType<double>(data['dosagem']),
        medida: data['medida'] as String?,
      );

  static HorariosStruct? maybeFromMap(dynamic data) =>
      data is Map ? HorariosStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'horario': _horario,
        'dosagem': _dosagem,
        'medida': _medida,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'horario': serializeParam(
          _horario,
          ParamType.DateTime,
        ),
        'dosagem': serializeParam(
          _dosagem,
          ParamType.double,
        ),
        'medida': serializeParam(
          _medida,
          ParamType.String,
        ),
      }.withoutNulls;

  static HorariosStruct fromSerializableMap(Map<String, dynamic> data) =>
      HorariosStruct(
        horario: deserializeParam(
          data['horario'],
          ParamType.DateTime,
          false,
        ),
        dosagem: deserializeParam(
          data['dosagem'],
          ParamType.double,
          false,
        ),
        medida: deserializeParam(
          data['medida'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HorariosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HorariosStruct &&
        horario == other.horario &&
        dosagem == other.dosagem &&
        medida == other.medida;
  }

  @override
  int get hashCode => const ListEquality().hash([horario, dosagem, medida]);
}

HorariosStruct createHorariosStruct({
  DateTime? horario,
  double? dosagem,
  String? medida,
}) =>
    HorariosStruct(
      horario: horario,
      dosagem: dosagem,
      medida: medida,
    );
