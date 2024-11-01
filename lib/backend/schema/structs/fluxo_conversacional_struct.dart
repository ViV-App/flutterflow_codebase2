// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FluxoConversacionalStruct extends BaseStruct {
  FluxoConversacionalStruct({
    String? nomeFluxo,
    bool? iniciado,
    bool? finalizado,
    int? perguntaAtual,
  })  : _nomeFluxo = nomeFluxo,
        _iniciado = iniciado,
        _finalizado = finalizado,
        _perguntaAtual = perguntaAtual;

  // "nome_fluxo" field.
  String? _nomeFluxo;
  String get nomeFluxo => _nomeFluxo ?? '';
  set nomeFluxo(String? val) => _nomeFluxo = val;

  bool hasNomeFluxo() => _nomeFluxo != null;

  // "iniciado" field.
  bool? _iniciado;
  bool get iniciado => _iniciado ?? false;
  set iniciado(bool? val) => _iniciado = val;

  bool hasIniciado() => _iniciado != null;

  // "finalizado" field.
  bool? _finalizado;
  bool get finalizado => _finalizado ?? false;
  set finalizado(bool? val) => _finalizado = val;

  bool hasFinalizado() => _finalizado != null;

  // "pergunta_atual" field.
  int? _perguntaAtual;
  int get perguntaAtual => _perguntaAtual ?? 0;
  set perguntaAtual(int? val) => _perguntaAtual = val;

  void incrementPerguntaAtual(int amount) =>
      perguntaAtual = perguntaAtual + amount;

  bool hasPerguntaAtual() => _perguntaAtual != null;

  static FluxoConversacionalStruct fromMap(Map<String, dynamic> data) =>
      FluxoConversacionalStruct(
        nomeFluxo: data['nome_fluxo'] as String?,
        iniciado: data['iniciado'] as bool?,
        finalizado: data['finalizado'] as bool?,
        perguntaAtual: castToType<int>(data['pergunta_atual']),
      );

  static FluxoConversacionalStruct? maybeFromMap(dynamic data) => data is Map
      ? FluxoConversacionalStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nome_fluxo': _nomeFluxo,
        'iniciado': _iniciado,
        'finalizado': _finalizado,
        'pergunta_atual': _perguntaAtual,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nome_fluxo': serializeParam(
          _nomeFluxo,
          ParamType.String,
        ),
        'iniciado': serializeParam(
          _iniciado,
          ParamType.bool,
        ),
        'finalizado': serializeParam(
          _finalizado,
          ParamType.bool,
        ),
        'pergunta_atual': serializeParam(
          _perguntaAtual,
          ParamType.int,
        ),
      }.withoutNulls;

  static FluxoConversacionalStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FluxoConversacionalStruct(
        nomeFluxo: deserializeParam(
          data['nome_fluxo'],
          ParamType.String,
          false,
        ),
        iniciado: deserializeParam(
          data['iniciado'],
          ParamType.bool,
          false,
        ),
        finalizado: deserializeParam(
          data['finalizado'],
          ParamType.bool,
          false,
        ),
        perguntaAtual: deserializeParam(
          data['pergunta_atual'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'FluxoConversacionalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FluxoConversacionalStruct &&
        nomeFluxo == other.nomeFluxo &&
        iniciado == other.iniciado &&
        finalizado == other.finalizado &&
        perguntaAtual == other.perguntaAtual;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([nomeFluxo, iniciado, finalizado, perguntaAtual]);
}

FluxoConversacionalStruct createFluxoConversacionalStruct({
  String? nomeFluxo,
  bool? iniciado,
  bool? finalizado,
  int? perguntaAtual,
}) =>
    FluxoConversacionalStruct(
      nomeFluxo: nomeFluxo,
      iniciado: iniciado,
      finalizado: finalizado,
      perguntaAtual: perguntaAtual,
    );
