import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'horario_prescricao_widget.dart' show HorarioPrescricaoWidget;
import 'package:flutter/material.dart';

class HorarioPrescricaoModel extends FlutterFlowModel<HorarioPrescricaoWidget> {
  ///  Local state fields for this component.

  DateTime? time;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
