// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionarioStruct extends BaseStruct {
  QuestionarioStruct({
    String? pergunta,
    List<PerguntasQuestionarioStruct>? opcoes,
    PerguntasQuestionarioStruct? resposta,
    String? respostaString,
  })  : _pergunta = pergunta,
        _opcoes = opcoes,
        _resposta = resposta,
        _respostaString = respostaString;

  // "pergunta" field.
  String? _pergunta;
  String get pergunta => _pergunta ?? '';
  set pergunta(String? val) => _pergunta = val;

  bool hasPergunta() => _pergunta != null;

  // "opcoes" field.
  List<PerguntasQuestionarioStruct>? _opcoes;
  List<PerguntasQuestionarioStruct> get opcoes => _opcoes ?? const [];
  set opcoes(List<PerguntasQuestionarioStruct>? val) => _opcoes = val;

  void updateOpcoes(Function(List<PerguntasQuestionarioStruct>) updateFn) {
    updateFn(_opcoes ??= []);
  }

  bool hasOpcoes() => _opcoes != null;

  // "resposta" field.
  PerguntasQuestionarioStruct? _resposta;
  PerguntasQuestionarioStruct get resposta =>
      _resposta ?? PerguntasQuestionarioStruct();
  set resposta(PerguntasQuestionarioStruct? val) => _resposta = val;

  void updateResposta(Function(PerguntasQuestionarioStruct) updateFn) {
    updateFn(_resposta ??= PerguntasQuestionarioStruct());
  }

  bool hasResposta() => _resposta != null;

  // "resposta_string" field.
  String? _respostaString;
  String get respostaString => _respostaString ?? '';
  set respostaString(String? val) => _respostaString = val;

  bool hasRespostaString() => _respostaString != null;

  static QuestionarioStruct fromMap(Map<String, dynamic> data) =>
      QuestionarioStruct(
        pergunta: data['pergunta'] as String?,
        opcoes: getStructList(
          data['opcoes'],
          PerguntasQuestionarioStruct.fromMap,
        ),
        resposta: PerguntasQuestionarioStruct.maybeFromMap(data['resposta']),
        respostaString: data['resposta_string'] as String?,
      );

  static QuestionarioStruct? maybeFromMap(dynamic data) => data is Map
      ? QuestionarioStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'pergunta': _pergunta,
        'opcoes': _opcoes?.map((e) => e.toMap()).toList(),
        'resposta': _resposta?.toMap(),
        'resposta_string': _respostaString,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pergunta': serializeParam(
          _pergunta,
          ParamType.String,
        ),
        'opcoes': serializeParam(
          _opcoes,
          ParamType.DataStruct,
          isList: true,
        ),
        'resposta': serializeParam(
          _resposta,
          ParamType.DataStruct,
        ),
        'resposta_string': serializeParam(
          _respostaString,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuestionarioStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionarioStruct(
        pergunta: deserializeParam(
          data['pergunta'],
          ParamType.String,
          false,
        ),
        opcoes: deserializeStructParam<PerguntasQuestionarioStruct>(
          data['opcoes'],
          ParamType.DataStruct,
          true,
          structBuilder: PerguntasQuestionarioStruct.fromSerializableMap,
        ),
        resposta: deserializeStructParam(
          data['resposta'],
          ParamType.DataStruct,
          false,
          structBuilder: PerguntasQuestionarioStruct.fromSerializableMap,
        ),
        respostaString: deserializeParam(
          data['resposta_string'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QuestionarioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuestionarioStruct &&
        pergunta == other.pergunta &&
        listEquality.equals(opcoes, other.opcoes) &&
        resposta == other.resposta &&
        respostaString == other.respostaString;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([pergunta, opcoes, resposta, respostaString]);
}

QuestionarioStruct createQuestionarioStruct({
  String? pergunta,
  PerguntasQuestionarioStruct? resposta,
  String? respostaString,
}) =>
    QuestionarioStruct(
      pergunta: pergunta,
      resposta: resposta ?? PerguntasQuestionarioStruct(),
      respostaString: respostaString,
    );
