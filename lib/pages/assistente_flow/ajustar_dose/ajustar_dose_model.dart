import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ajustar_dose_widget.dart' show AjustarDoseWidget;
import 'package:flutter/material.dart';

class AjustarDoseModel extends FlutterFlowModel<AjustarDoseWidget> {
  ///  Local state fields for this page.

  int currentStep = 1;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<StatusPacientRow>? status1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
