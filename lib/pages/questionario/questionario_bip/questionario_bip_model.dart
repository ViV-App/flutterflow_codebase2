import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/questionario/questionario_ask/questionario_ask_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'questionario_bip_widget.dart' show QuestionarioBipWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class QuestionarioBipModel extends FlutterFlowModel<QuestionarioBipWidget> {
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

  // Stores action output result for [Backend Call - API (reset form responses)] action in questionarioBip widget.
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
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<AjusteDoseRequisicaoRow>? req;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<AjusteDoseRequisicaoRow>? req11;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<AjusteDoseRequisicaoRow>? req1;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<AjusteDoseRequisicaoRow>? req12;

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
