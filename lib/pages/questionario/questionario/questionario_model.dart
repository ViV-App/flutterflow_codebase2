import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/questionario/questionario_ask/questionario_ask_widget.dart';
import '/flutter_flow/request_manager.dart';

import 'questionario_widget.dart' show QuestionarioWidget;
import 'package:flutter/material.dart';

class QuestionarioModel extends FlutterFlowModel<QuestionarioWidget> {
  ///  Local state fields for this page.

  int? nextQuestion;

  List<int> previuousQuestions = [];
  void addToPreviuousQuestions(int item) => previuousQuestions.add(item);
  void removeFromPreviuousQuestions(int item) =>
      previuousQuestions.remove(item);
  void removeAtIndexFromPreviuousQuestions(int index) =>
      previuousQuestions.removeAt(index);
  void insertAtIndexInPreviuousQuestions(int index, int item) =>
      previuousQuestions.insert(index, item);
  void updatePreviuousQuestionsAtIndex(int index, Function(int) updateFn) =>
      previuousQuestions[index] = updateFn(previuousQuestions[index]);

  bool lastQuestion = false;

  int? prevNextQuestion;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (reset form responses)] action in questionario widget.
  ApiCallResponse? apiResultwq1;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for questionarioAsk dynamic component.
  late FlutterFlowDynamicModels<QuestionarioAskModel> questionarioAskModels;
  // Stores action output result for [Backend Call - API (generate responses)] action in Button widget.
  ApiCallResponse? apiResultr3x;
  // Stores action output result for [Backend Call - API (generate responses)] action in Button widget.
  ApiCallResponse? apiResultr3xd3;
  // Stores action output result for [Backend Call - API (generate responses)] action in Button widget.
  ApiCallResponse? apiResultr3xd3a;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<StatusPacientRow>? qefef;
  // Stores action output result for [Backend Call - API (tracking)] action in Button widget.
  ApiCallResponse? apiResultoio;

  /// Query cache managers for this widget.

  final _loaderManager = FutureRequestManager<List<RespostasQuestionarioRow>>();
  Future<List<RespostasQuestionarioRow>> loader({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<RespostasQuestionarioRow>> Function() requestFn,
  }) =>
      _loaderManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearLoaderCache() => _loaderManager.clear();
  void clearLoaderCacheKey(String? uniqueKey) =>
      _loaderManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    questionarioAskModels =
        FlutterFlowDynamicModels(() => QuestionarioAskModel());
  }

  @override
  void dispose() {
    questionarioAskModels.dispose();

    /// Dispose query cache managers for this widget.

    clearLoaderCache();
  }
}
