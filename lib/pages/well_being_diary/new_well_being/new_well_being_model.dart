import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/well_being_diary/queixa_question/queixa_question_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'new_well_being_widget.dart' show NewWellBeingWidget;
import 'package:flutter/material.dart';

class NewWellBeingModel extends FlutterFlowModel<NewWellBeingWidget> {
  ///  Local state fields for this component.

  int? mood;

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

  List<dynamic> respostas = [];
  void addToRespostas(dynamic item) => respostas.add(item);
  void removeFromRespostas(dynamic item) => respostas.remove(item);
  void removeAtIndexFromRespostas(int index) => respostas.removeAt(index);
  void insertAtIndexInRespostas(int index, dynamic item) =>
      respostas.insert(index, item);
  void updateRespostasAtIndex(int index, Function(dynamic) updateFn) =>
      respostas[index] = updateFn(respostas[index]);

  List<dynamic> pesoQ = [];
  void addToPesoQ(dynamic item) => pesoQ.add(item);
  void removeFromPesoQ(dynamic item) => pesoQ.remove(item);
  void removeAtIndexFromPesoQ(int index) => pesoQ.removeAt(index);
  void insertAtIndexInPesoQ(int index, dynamic item) =>
      pesoQ.insert(index, item);
  void updatePesoQAtIndex(int index, Function(dynamic) updateFn) =>
      pesoQ[index] = updateFn(pesoQ[index]);

  List<String> queixas = [];
  void addToQueixas(String item) => queixas.add(item);
  void removeFromQueixas(String item) => queixas.remove(item);
  void removeAtIndexFromQueixas(int index) => queixas.removeAt(index);
  void insertAtIndexInQueixas(int index, String item) =>
      queixas.insert(index, item);
  void updateQueixasAtIndex(int index, Function(String) updateFn) =>
      queixas[index] = updateFn(queixas[index]);

  dynamic emptyFields;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (tracking)] action in newWellBeing widget.
  ApiCallResponse? apiResultgd4;
  // Stores action output result for [Backend Call - API (tracking)] action in Container widget.
  ApiCallResponse? apiResultgd4v;
  // Stores action output result for [Backend Call - API (tracking)] action in Container widget.
  ApiCallResponse? apiResultgd4vv;
  // Stores action output result for [Backend Call - API (tracking)] action in Container widget.
  ApiCallResponse? apiResultgd4vzs;
  // Stores action output result for [Backend Call - API (tracking)] action in Container widget.
  ApiCallResponse? apiResultgd4vnr;
  // Stores action output result for [Backend Call - API (tracking)] action in Container widget.
  ApiCallResponse? apiResultgd4vrefg;
  // Model for queixaQuestion component.
  late QueixaQuestionModel queixaQuestionModel;
  // Stores action output result for [Backend Call - API (tracking)] action in Container widget.
  ApiCallResponse? apiResultgd4verg;
  // Stores action output result for [Backend Call - API (tracking)] action in Container widget.
  ApiCallResponse? apiResultgd4vergfrv;
  // State field(s) for EfeitoCustom widget.
  FocusNode? efeitoCustomFocusNode;
  TextEditingController? efeitoCustomTextController;
  String? Function(BuildContext, String?)? efeitoCustomTextControllerValidator;
  // Stores action output result for [Backend Call - API (tracking)] action in IconButton widget.
  ApiCallResponse? apiResultgd4vergwh;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (tracking)] action in TextField widget.
  ApiCallResponse? apiResultgd4vergCopy;
  // Stores action output result for [Backend Call - API (send bem viver response)] action in Button widget.
  ApiCallResponse? apiResult7x9;

  @override
  void initState(BuildContext context) {
    queixaQuestionModel = createModel(context, () => QueixaQuestionModel());
  }

  @override
  void dispose() {
    queixaQuestionModel.dispose();
    efeitoCustomFocusNode?.dispose();
    efeitoCustomTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }

  /// Action blocks.
  Future setComponent(BuildContext context) async {
    queixas = widget!.pacient!.queixas.toList().cast<String>();
    insertAtIndexInQueixas(0, widget!.pacient!.queixaPrincipal!);
    pesoQ = functions.inferirPesos(queixas.toList()).toList().cast<dynamic>();
  }
}
