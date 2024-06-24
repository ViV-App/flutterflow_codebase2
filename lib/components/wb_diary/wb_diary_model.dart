import '/flutter_flow/flutter_flow_util.dart';
import 'wb_diary_widget.dart' show WbDiaryWidget;
import 'package:flutter/material.dart';

class WbDiaryModel extends FlutterFlowModel<WbDiaryWidget> {
  ///  Local state fields for this component.

  int? mood = 0;

  int? ansiedade;

  int? sono;

  List<String> effects = [];
  void addToEffects(String item) => effects.add(item);
  void removeFromEffects(String item) => effects.remove(item);
  void removeAtIndexFromEffects(int index) => effects.removeAt(index);
  void insertAtIndexInEffects(int index, String item) =>
      effects.insert(index, item);
  void updateEffectsAtIndex(int index, Function(String) updateFn) =>
      effects[index] = updateFn(effects[index]);

  int? step = 2;

  List<String> effectsCustom = [];
  void addToEffectsCustom(String item) => effectsCustom.add(item);
  void removeFromEffectsCustom(String item) => effectsCustom.remove(item);
  void removeAtIndexFromEffectsCustom(int index) =>
      effectsCustom.removeAt(index);
  void insertAtIndexInEffectsCustom(int index, String item) =>
      effectsCustom.insert(index, item);
  void updateEffectsCustomAtIndex(int index, Function(String) updateFn) =>
      effectsCustom[index] = updateFn(effectsCustom[index]);

  int? dor;

  List<int> intOptions = [0, 1, 2, 3, 4];
  void addToIntOptions(int item) => intOptions.add(item);
  void removeFromIntOptions(int item) => intOptions.remove(item);
  void removeAtIndexFromIntOptions(int index) => intOptions.removeAt(index);
  void insertAtIndexInIntOptions(int index, int item) =>
      intOptions.insert(index, item);
  void updateIntOptionsAtIndex(int index, Function(int) updateFn) =>
      intOptions[index] = updateFn(intOptions[index]);

  int? okk;

  ///  State fields for stateful widgets in this component.

  // State field(s) for EfeitoCustom widget.
  FocusNode? efeitoCustomFocusNode;
  TextEditingController? efeitoCustomTextController;
  String? Function(BuildContext, String?)? efeitoCustomTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    efeitoCustomFocusNode?.dispose();
    efeitoCustomTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
