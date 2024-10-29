import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'delete_prescription_widget.dart' show DeletePrescriptionWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DeletePrescriptionModel
    extends FlutterFlowModel<DeletePrescriptionWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Delete Row(s)] action in Button widget.
  List<PrescricaoRow>? ukkgu;
  // Stores action output result for [Backend Call - API (tracking)] action in Button widget.
  ApiCallResponse? apiResult23ov;
  // Stores action output result for [Backend Call - API (tracking)] action in Button widget.
  ApiCallResponse? apiResult23o;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
