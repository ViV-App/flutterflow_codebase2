import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'prescricao01_widget.dart' show Prescricao01Widget;
import 'package:flutter/material.dart';

class Prescricao01Model extends FlutterFlowModel<Prescricao01Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  int? dropDownValue2;
  FormFieldController<int>? dropDownValueController2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
