import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'planos_widget.dart' show PlanosWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
