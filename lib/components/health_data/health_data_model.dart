import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/toast/toast_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'health_data_widget.dart' show HealthDataWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HealthDataModel extends FlutterFlowModel<HealthDataWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for nomeMed widget.
  FocusNode? nomeMedFocusNode;
  TextEditingController? nomeMedTextController;
  String? Function(BuildContext, String?)? nomeMedTextControllerValidator;
  // State field(s) for crm widget.
  FocusNode? crmFocusNode;
  TextEditingController? crmTextController;
  String? Function(BuildContext, String?)? crmTextControllerValidator;
  // State field(s) for uf widget.
  String? ufValue;
  FormFieldController<String>? ufValueController;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController3;
  final textFieldMask1 = MaskTextInputFormatter(mask: '#.##');
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController4;
  final textFieldMask2 = MaskTextInputFormatter(mask: '###');
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
    nomeMedFocusNode?.dispose();
    nomeMedTextController?.dispose();

    crmFocusNode?.dispose();
    crmTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController3?.dispose();

    textFieldFocusNode2?.dispose();
    textController4?.dispose();
  }
}
