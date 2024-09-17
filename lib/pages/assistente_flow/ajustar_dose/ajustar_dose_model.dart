import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ajustar_dose_widget.dart' show AjustarDoseWidget;
import 'package:flutter/material.dart';

class AjustarDoseModel extends FlutterFlowModel<AjustarDoseWidget> {
  ///  Local state fields for this page.

  int currentStep = 1;

  AjusteDoseRequisicaoRow? reqAtual;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in ajustarDose widget.
  List<AjusteDoseRequisicaoRow>? reqs2;
  // Stores action output result for [Backend Call - Query Rows] action in ajustarDose widget.
  List<BipVigenteRow>? bipV;
  // Stores action output result for [Backend Call - Query Rows] action in ajustarDose widget.
  List<PacienteRow>? cUser;
  // Stores action output result for [Backend Call - Query Rows] action in ajustarDose widget.
  List<AjusteDoseRequisicaoRow>? reqAt;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<StatusPacientRow>? status1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
