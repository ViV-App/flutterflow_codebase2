import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'meu_plano_widget.dart' show MeuPlanoWidget;
import 'package:flutter/material.dart';

class MeuPlanoModel extends FlutterFlowModel<MeuPlanoWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (tracking)] action in meuPlano widget.
  ApiCallResponse? apiResult23r;
  Completer<List<AssinaturaRow>>? requestCompleter;

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
