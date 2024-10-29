import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/edit_prescription/edit_prescription_widget.dart';
import '/components/remedio_card/remedio_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'remedios_widget.dart' show RemediosWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class RemediosModel extends FlutterFlowModel<RemediosWidget> {
  ///  Local state fields for this page.

  List<int> list = [];
  void addToList(int item) => list.add(item);
  void removeFromList(int item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, int item) => list.insert(index, item);
  void updateListAtIndex(int index, Function(int) updateFn) =>
      list[index] = updateFn(list[index]);

  ///  State fields for stateful widgets in this page.

  bool requestCompleted = false;
  String? requestLastUniqueKey;
  // Stores action output result for [Backend Call - API (tracking)] action in remedios widget.
  ApiCallResponse? apiResultwcv;
  // Stores action output result for [Backend Call - Query Rows] action in remedioCard widget.
  List<PrescricaoRow>? rtnPrescription;
  // Stores action output result for [Backend Call - API (tracking)] action in remedioCard widget.
  ApiCallResponse? apiResultltc;
  // Stores action output result for [Backend Call - API (tracking)] action in Button widget.
  ApiCallResponse? apiResultwcvv;

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
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
