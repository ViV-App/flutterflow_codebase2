import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'prescription_added_copy_widget.dart' show PrescriptionAddedCopyWidget;
import 'package:flutter/material.dart';

class PrescriptionAddedCopyModel
    extends FlutterFlowModel<PrescriptionAddedCopyWidget> {
  ///  Local state fields for this component.

  DateTime? dateInit;

  DateTime? dateEnd;

  bool analiseOpen = false;

  AnaliseStruct? analise;
  void updateAnaliseStruct(Function(AnaliseStruct) updateFn) {
    updateFn(analise ??= AnaliseStruct());
  }

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (analiseEvolucao)] action in Button widget.
  ApiCallResponse? apiResult5hot;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  AnaliseEvolucaoRow? bdfb;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
