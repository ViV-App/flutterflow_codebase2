import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'prescricao02_widget.dart' show Prescricao02Widget;
import 'package:flutter/material.dart';

class Prescricao02Model extends FlutterFlowModel<Prescricao02Widget> {
  ///  Local state fields for this page.

  List<int> list = [0];
  void addToList(int item) => list.add(item);
  void removeFromList(int item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, int item) => list.insert(index, item);
  void updateListAtIndex(int index, Function(int) updateFn) =>
      list[index] = updateFn(list[index]);

  List<String> shot = [];
  void addToShot(String item) => shot.add(item);
  void removeFromShot(String item) => shot.remove(item);
  void removeAtIndexFromShot(int index) => shot.removeAt(index);
  void insertAtIndexInShot(int index, String item) => shot.insert(index, item);
  void updateShotAtIndex(int index, Function(String) updateFn) =>
      shot[index] = updateFn(shot[index]);

  List<DateTime> horario = [];
  void addToHorario(DateTime item) => horario.add(item);
  void removeFromHorario(DateTime item) => horario.remove(item);
  void removeAtIndexFromHorario(int index) => horario.removeAt(index);
  void insertAtIndexInHorario(int index, DateTime item) =>
      horario.insert(index, item);
  void updateHorarioAtIndex(int index, Function(DateTime) updateFn) =>
      horario[index] = updateFn(horario[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  DateTime? datePicked;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
