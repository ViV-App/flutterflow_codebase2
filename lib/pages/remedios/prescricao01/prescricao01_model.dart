import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'prescricao01_widget.dart' show Prescricao01Widget;
import 'package:flutter/material.dart';

class Prescricao01Model extends FlutterFlowModel<Prescricao01Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for inpCannabis widget.
  final inpCannabisKey = GlobalKey();
  FocusNode? inpCannabisFocusNode;
  TextEditingController? inpCannabisTextController;
  String? inpCannabisSelectedOption;
  String? Function(BuildContext, String?)? inpCannabisTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in inpCannabis widget.
  List<StaticMedicamentosRow>? medCopyCopy;
  // Stores action output result for [Backend Call - Query Rows] action in inpCannabis widget.
  List<StaticMedicamentosRow>? medCopy;
  // Stores action output result for [Backend Call - Query Rows] action in inpCannabis widget.
  List<StaticMedicamentosRow>? medCopyCopy2;
  // State field(s) for inpMedc widget.
  FocusNode? inpMedcFocusNode;
  TextEditingController? inpMedcTextController;
  String? Function(BuildContext, String?)? inpMedcTextControllerValidator;
  // State field(s) for DropDown widget.
  int? dropDownValue2;
  FormFieldController<int>? dropDownValueController2;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<StaticMedicamentosRow>? medc1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inpCannabisFocusNode?.dispose();

    inpMedcFocusNode?.dispose();
    inpMedcTextController?.dispose();
  }
}
