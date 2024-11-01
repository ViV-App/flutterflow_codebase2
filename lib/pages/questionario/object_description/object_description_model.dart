import '/flutter_flow/flutter_flow_util.dart';
import 'object_description_widget.dart' show ObjectDescriptionWidget;
import 'package:flutter/material.dart';

class ObjectDescriptionModel extends FlutterFlowModel<ObjectDescriptionWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
