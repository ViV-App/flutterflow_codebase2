import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_viv_widget.dart' show ChatVivWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class ChatVivModel extends FlutterFlowModel<ChatVivWidget> {
  ///  Local state fields for this page.

  bool typing = false;

  String? lastM;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for mainColumn widget.
  ScrollController? mainColumn;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Icon widget.
  MensagemRow? myMessage;
  Completer<List<MensagemRow>>? requestCompleter;
  // Stores action output result for [Backend Call - API (callChat)] action in Icon widget.
  ApiCallResponse? apiResultt290;

  @override
  void initState(BuildContext context) {
    mainColumn = ScrollController();
    listViewController = ScrollController();
    columnController = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mainColumn?.dispose();
    listViewController?.dispose();
    columnController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

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
