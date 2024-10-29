// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PerguntasQuestionarioStruct extends BaseStruct {
  PerguntasQuestionarioStruct({
    String? resposta,
    int? prevQuestion,
    int? nextQuestion,
  })  : _resposta = resposta,
        _prevQuestion = prevQuestion,
        _nextQuestion = nextQuestion;

  // "resposta" field.
  String? _resposta;
  String get resposta => _resposta ?? '';
  set resposta(String? val) => _resposta = val;

  bool hasResposta() => _resposta != null;

  // "prev_question" field.
  int? _prevQuestion;
  int get prevQuestion => _prevQuestion ?? 0;
  set prevQuestion(int? val) => _prevQuestion = val;

  void incrementPrevQuestion(int amount) =>
      prevQuestion = prevQuestion + amount;

  bool hasPrevQuestion() => _prevQuestion != null;

  // "next_question" field.
  int? _nextQuestion;
  int get nextQuestion => _nextQuestion ?? 0;
  set nextQuestion(int? val) => _nextQuestion = val;

  void incrementNextQuestion(int amount) =>
      nextQuestion = nextQuestion + amount;

  bool hasNextQuestion() => _nextQuestion != null;

  static PerguntasQuestionarioStruct fromMap(Map<String, dynamic> data) =>
      PerguntasQuestionarioStruct(
        resposta: data['resposta'] as String?,
        prevQuestion: castToType<int>(data['prev_question']),
        nextQuestion: castToType<int>(data['next_question']),
      );

  static PerguntasQuestionarioStruct? maybeFromMap(dynamic data) => data is Map
      ? PerguntasQuestionarioStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'resposta': _resposta,
        'prev_question': _prevQuestion,
        'next_question': _nextQuestion,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'resposta': serializeParam(
          _resposta,
          ParamType.String,
        ),
        'prev_question': serializeParam(
          _prevQuestion,
          ParamType.int,
        ),
        'next_question': serializeParam(
          _nextQuestion,
          ParamType.int,
        ),
      }.withoutNulls;

  static PerguntasQuestionarioStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PerguntasQuestionarioStruct(
        resposta: deserializeParam(
          data['resposta'],
          ParamType.String,
          false,
        ),
        prevQuestion: deserializeParam(
          data['prev_question'],
          ParamType.int,
          false,
        ),
        nextQuestion: deserializeParam(
          data['next_question'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PerguntasQuestionarioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PerguntasQuestionarioStruct &&
        resposta == other.resposta &&
        prevQuestion == other.prevQuestion &&
        nextQuestion == other.nextQuestion;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([resposta, prevQuestion, nextQuestion]);
}

PerguntasQuestionarioStruct createPerguntasQuestionarioStruct({
  String? resposta,
  int? prevQuestion,
  int? nextQuestion,
}) =>
    PerguntasQuestionarioStruct(
      resposta: resposta,
      prevQuestion: prevQuestion,
      nextQuestion: nextQuestion,
    );
