import '/flutter_flow/flutter_flow_util.dart';
import 'form_historico01_widget.dart' show FormHistorico01Widget;
import 'package:flutter/material.dart';

class FormHistorico01Model extends FlutterFlowModel<FormHistorico01Widget> {
  ///  Local state fields for this page.

  List<int> list = [];
  void addToList(int item) => list.add(item);
  void removeFromList(int item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, int item) => list.insert(index, item);
  void updateListAtIndex(int index, Function(int) updateFn) =>
      list[index] = updateFn(list[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}
