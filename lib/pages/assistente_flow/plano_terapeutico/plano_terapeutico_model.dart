import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'plano_terapeutico_widget.dart' show PlanoTerapeuticoWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlanoTerapeuticoModel extends FlutterFlowModel<PlanoTerapeuticoWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in planoTerapeutico widget.
  List<StatusPacientRow>? status;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
