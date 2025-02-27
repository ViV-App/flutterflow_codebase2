import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'planos_widget.dart' show PlanosWidget;
import 'package:flutter/material.dart';

class PlanosModel extends FlutterFlowModel<PlanosWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (tracking)] action in planos widget.
  ApiCallResponse? apiResult23r;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PacienteRow>? currentUser;
  // Stores action output result for [Backend Call - API (verify contra indicacoes)] action in Button widget.
  ApiCallResponse? res;
  // Stores action output result for [Backend Call - API (has cannabis medication)] action in Button widget.
  ApiCallResponse? hasCanMed;
  // Stores action output result for [Backend Call - API (tracking)] action in Button widget.
  ApiCallResponse? apiResult23rmv;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
