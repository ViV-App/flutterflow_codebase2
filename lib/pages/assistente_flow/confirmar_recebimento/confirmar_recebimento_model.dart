import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'confirmar_recebimento_widget.dart' show ConfirmarRecebimentoWidget;
import 'package:flutter/material.dart';

class ConfirmarRecebimentoModel
    extends FlutterFlowModel<ConfirmarRecebimentoWidget> {
  ///  Local state fields for this page.

  int currentStep = 1;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<StatusPacientRow>? status1;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<StatusPacientRow>? status;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
