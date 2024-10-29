// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RespostaQuestStruct extends BaseStruct {
  RespostaQuestStruct({
    int? ordem,
    String? pergunta,
    String? resposta,
  })  : _ordem = ordem,
        _pergunta = pergunta,
        _resposta = resposta;

  // "ordem" field.
  int? _ordem;
  int get ordem => _ordem ?? 0;
  set ordem(int? val) => _ordem = val;

  void incrementOrdem(int amount) => ordem = ordem + amount;

  bool hasOrdem() => _ordem != null;

  // "pergunta" field.
  String? _pergunta;
  String get pergunta => _pergunta ?? '';
  set pergunta(String? val) => _pergunta = val;

  bool hasPergunta() => _pergunta != null;

  // "resposta" field.
  String? _resposta;
  String get resposta => _resposta ?? '';
  set resposta(String? val) => _resposta = val;

  bool hasResposta() => _resposta != null;

  static RespostaQuestStruct fromMap(Map<String, dynamic> data) =>
      RespostaQuestStruct(
        ordem: castToType<int>(data['ordem']),
        pergunta: data['pergunta'] as String?,
        resposta: data['resposta'] as String?,
      );

  static RespostaQuestStruct? maybeFromMap(dynamic data) => data is Map
      ? RespostaQuestStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ordem': _ordem,
        'pergunta': _pergunta,
        'resposta': _resposta,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ordem': serializeParam(
          _ordem,
          ParamType.int,
        ),
        'pergunta': serializeParam(
          _pergunta,
          ParamType.String,
        ),
        'resposta': serializeParam(
          _resposta,
          ParamType.String,
        ),
      }.withoutNulls;

  static RespostaQuestStruct fromSerializableMap(Map<String, dynamic> data) =>
      RespostaQuestStruct(
        ordem: deserializeParam(
          data['ordem'],
          ParamType.int,
          false,
        ),
        pergunta: deserializeParam(
          data['pergunta'],
          ParamType.String,
          false,
        ),
        resposta: deserializeParam(
          data['resposta'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RespostaQuestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RespostaQuestStruct &&
        ordem == other.ordem &&
        pergunta == other.pergunta &&
        resposta == other.resposta;
  }

  @override
  int get hashCode => const ListEquality().hash([ordem, pergunta, resposta]);
}

RespostaQuestStruct createRespostaQuestStruct({
  int? ordem,
  String? pergunta,
  String? resposta,
}) =>
    RespostaQuestStruct(
      ordem: ordem,
      pergunta: pergunta,
      resposta: resposta,
    );
