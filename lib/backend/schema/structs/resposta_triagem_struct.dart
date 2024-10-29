// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RespostaTriagemStruct extends BaseStruct {
  RespostaTriagemStruct({
    bool? aceitaColetarDados,
    String? estadoCivil,
  })  : _aceitaColetarDados = aceitaColetarDados,
        _estadoCivil = estadoCivil;

  // "aceitaColetarDados" field.
  bool? _aceitaColetarDados;
  bool get aceitaColetarDados => _aceitaColetarDados ?? false;
  set aceitaColetarDados(bool? val) => _aceitaColetarDados = val;

  bool hasAceitaColetarDados() => _aceitaColetarDados != null;

  // "estadoCivil" field.
  String? _estadoCivil;
  String get estadoCivil => _estadoCivil ?? '';
  set estadoCivil(String? val) => _estadoCivil = val;

  bool hasEstadoCivil() => _estadoCivil != null;

  static RespostaTriagemStruct fromMap(Map<String, dynamic> data) =>
      RespostaTriagemStruct(
        aceitaColetarDados: data['aceitaColetarDados'] as bool?,
        estadoCivil: data['estadoCivil'] as String?,
      );

  static RespostaTriagemStruct? maybeFromMap(dynamic data) => data is Map
      ? RespostaTriagemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'aceitaColetarDados': _aceitaColetarDados,
        'estadoCivil': _estadoCivil,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'aceitaColetarDados': serializeParam(
          _aceitaColetarDados,
          ParamType.bool,
        ),
        'estadoCivil': serializeParam(
          _estadoCivil,
          ParamType.String,
        ),
      }.withoutNulls;

  static RespostaTriagemStruct fromSerializableMap(Map<String, dynamic> data) =>
      RespostaTriagemStruct(
        aceitaColetarDados: deserializeParam(
          data['aceitaColetarDados'],
          ParamType.bool,
          false,
        ),
        estadoCivil: deserializeParam(
          data['estadoCivil'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RespostaTriagemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RespostaTriagemStruct &&
        aceitaColetarDados == other.aceitaColetarDados &&
        estadoCivil == other.estadoCivil;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([aceitaColetarDados, estadoCivil]);
}

RespostaTriagemStruct createRespostaTriagemStruct({
  bool? aceitaColetarDados,
  String? estadoCivil,
}) =>
    RespostaTriagemStruct(
      aceitaColetarDados: aceitaColetarDados,
      estadoCivil: estadoCivil,
    );
