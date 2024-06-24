// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnaliseStruct extends BaseStruct {
  AnaliseStruct({
    String? titulo,
    String? nivel,
    String? analise,
  })  : _titulo = titulo,
        _nivel = nivel,
        _analise = analise;

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  set titulo(String? val) => _titulo = val;

  bool hasTitulo() => _titulo != null;

  // "nivel" field.
  String? _nivel;
  String get nivel => _nivel ?? '';
  set nivel(String? val) => _nivel = val;

  bool hasNivel() => _nivel != null;

  // "analise" field.
  String? _analise;
  String get analise => _analise ?? '';
  set analise(String? val) => _analise = val;

  bool hasAnalise() => _analise != null;

  static AnaliseStruct fromMap(Map<String, dynamic> data) => AnaliseStruct(
        titulo: data['titulo'] as String?,
        nivel: data['nivel'] as String?,
        analise: data['analise'] as String?,
      );

  static AnaliseStruct? maybeFromMap(dynamic data) =>
      data is Map ? AnaliseStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'titulo': _titulo,
        'nivel': _nivel,
        'analise': _analise,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'titulo': serializeParam(
          _titulo,
          ParamType.String,
        ),
        'nivel': serializeParam(
          _nivel,
          ParamType.String,
        ),
        'analise': serializeParam(
          _analise,
          ParamType.String,
        ),
      }.withoutNulls;

  static AnaliseStruct fromSerializableMap(Map<String, dynamic> data) =>
      AnaliseStruct(
        titulo: deserializeParam(
          data['titulo'],
          ParamType.String,
          false,
        ),
        nivel: deserializeParam(
          data['nivel'],
          ParamType.String,
          false,
        ),
        analise: deserializeParam(
          data['analise'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AnaliseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AnaliseStruct &&
        titulo == other.titulo &&
        nivel == other.nivel &&
        analise == other.analise;
  }

  @override
  int get hashCode => const ListEquality().hash([titulo, nivel, analise]);
}

AnaliseStruct createAnaliseStruct({
  String? titulo,
  String? nivel,
  String? analise,
}) =>
    AnaliseStruct(
      titulo: titulo,
      nivel: nivel,
      analise: analise,
    );
