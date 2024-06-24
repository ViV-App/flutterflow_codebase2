import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'health_data_widget.dart' show HealthDataWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HealthDataModel extends FlutterFlowModel<HealthDataWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  final textFieldMask3 = MaskTextInputFormatter(mask: '#.##');
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  final textFieldMask4 = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? textController4Validator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PacienteRow>? cUSer;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  MedicoRow? cMed;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<PacienteRow>? cUserEdit;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<MedicoRow>? upMed;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();
  }
}
