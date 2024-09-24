import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comprar_bip_widget.dart' show ComprarBipWidget;
import 'package:flutter/material.dart';

class ComprarBipModel extends FlutterFlowModel<ComprarBipWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PacienteRow>? user;
  // Stores action output result for [Backend Call - API (buy bip)] action in Button widget.
  ApiCallResponse? apiResult2ho;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
