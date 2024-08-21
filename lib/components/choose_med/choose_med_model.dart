import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'choose_med_widget.dart' show ChooseMedWidget;
import 'package:flutter/material.dart';

class ChooseMedModel extends FlutterFlowModel<ChooseMedWidget> {
  ///  Local state fields for this component.

  int? tab = 1;

  int? remedio;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in chooseMed widget.
  List<StaticMedicamentosRow>? remedioAtual;
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in TextField widget.
  List<StaticMedicamentosRow>? med;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
  }
}
