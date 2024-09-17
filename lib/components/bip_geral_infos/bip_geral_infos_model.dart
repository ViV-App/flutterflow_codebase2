import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bip_geral_infos_widget.dart' show BipGeralInfosWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class BipGeralInfosModel extends FlutterFlowModel<BipGeralInfosWidget> {
  ///  State fields for stateful widgets in this component.

  Completer<List<PacienteRow>>? requestCompleter;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<QuestionarioRow>? qst1;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<RespostasQuestionarioRow>? res1;
  // Stores action output result for [Backend Call - API (generate bip responses)] action in Button widget.
  ApiCallResponse? apiResulte7s;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<QuestionarioRow>? qst2;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<RespostasQuestionarioRow>? res2;
  // Stores action output result for [Backend Call - API (generate bip responses)] action in Button widget.
  ApiCallResponse? apiResulte7sd;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<QuestionarioRow>? qst3;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<RespostasQuestionarioRow>? res3;
  // Stores action output result for [Backend Call - API (generate bip responses)] action in Button widget.
  ApiCallResponse? apiResulte7sdz;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PacienteRow>? cUserN;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<QuestionarioRow>? qst0;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<RespostasQuestionarioRow>? resps;
  // Stores action output result for [Backend Call - API (generate bip responses)] action in Button widget.
  ApiCallResponse? apiResultik5;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
