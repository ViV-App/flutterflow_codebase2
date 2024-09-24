import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_viv_widget.dart' show ChatVivWidget;
import 'package:flutter/material.dart';

class ChatVivModel extends FlutterFlowModel<ChatVivWidget> {
  ///  Local state fields for this page.

  bool typing = false;

  String? lastM;

  bool? waiting = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in chatViv widget.
  List<ChatRow>? chat;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (senchatb)] action in Icon widget.
  ApiCallResponse? apiResultt290;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
