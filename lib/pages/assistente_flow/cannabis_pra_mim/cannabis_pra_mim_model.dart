import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/questionario/pergunta_widget/pergunta_widget_widget.dart';
import 'dart:async';
import 'cannabis_pra_mim_widget.dart' show CannabisPraMimWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CannabisPraMimModel extends FlutterFlowModel<CannabisPraMimWidget> {
  ///  Local state fields for this page.

  int? currentStep;

  List<dynamic> respostas = [];
  void addToRespostas(dynamic item) => respostas.add(item);
  void removeFromRespostas(dynamic item) => respostas.remove(item);
  void removeAtIndexFromRespostas(int index) => respostas.removeAt(index);
  void insertAtIndexInRespostas(int index, dynamic item) =>
      respostas.insert(index, item);
  void updateRespostasAtIndex(int index, Function(dynamic) updateFn) =>
      respostas[index] = updateFn(respostas[index]);

  dynamic respostaAtual;

  int? nextQuestion;

  List<int> prevList = [];
  void addToPrevList(int item) => prevList.add(item);
  void removeFromPrevList(int item) => prevList.remove(item);
  void removeAtIndexFromPrevList(int index) => prevList.removeAt(index);
  void insertAtIndexInPrevList(int index, int item) =>
      prevList.insert(index, item);
  void updatePrevListAtIndex(int index, Function(int) updateFn) =>
      prevList[index] = updateFn(prevList[index]);

  bool? respostaExiste = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for perguntaWidget dynamic component.
  late FlutterFlowDynamicModels<PerguntaWidgetModel> perguntaWidgetModels;

  @override
  void initState(BuildContext context) {
    perguntaWidgetModels =
        FlutterFlowDynamicModels(() => PerguntaWidgetModel());
  }

  @override
  void dispose() {
    perguntaWidgetModels.dispose();
  }
}
