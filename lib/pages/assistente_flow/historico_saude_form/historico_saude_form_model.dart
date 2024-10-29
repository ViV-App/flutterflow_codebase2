import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'historico_saude_form_widget.dart' show HistoricoSaudeFormWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class HistoricoSaudeFormModel
    extends FlutterFlowModel<HistoricoSaudeFormWidget> {
  ///  Local state fields for this component.

  int currentStep = 1;

  List<dynamic> jss = [];
  void addToJss(dynamic item) => jss.add(item);
  void removeFromJss(dynamic item) => jss.remove(item);
  void removeAtIndexFromJss(int index) => jss.removeAt(index);
  void insertAtIndexInJss(int index, dynamic item) => jss.insert(index, item);
  void updateJssAtIndex(int index, Function(dynamic) updateFn) =>
      jss[index] = updateFn(jss[index]);

  List<dynamic> jzs = [];
  void addToJzs(dynamic item) => jzs.add(item);
  void removeFromJzs(dynamic item) => jzs.remove(item);
  void removeAtIndexFromJzs(int index) => jzs.removeAt(index);
  void insertAtIndexInJzs(int index, dynamic item) => jzs.insert(index, item);
  void updateJzsAtIndex(int index, Function(dynamic) updateFn) =>
      jzs[index] = updateFn(jzs[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for altura widget.
  FocusNode? alturaFocusNode;
  TextEditingController? alturaTextController;
  String? Function(BuildContext, String?)? alturaTextControllerValidator;
  // State field(s) for peso widget.
  FocusNode? pesoFocusNode;
  TextEditingController? pesoTextController;
  String? Function(BuildContext, String?)? pesoTextControllerValidator;
  // State field(s) for q03 widget.
  bool? q03Value;
  FormFieldController<bool>? q03ValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for q05 widget.
  bool? q05Value;
  FormFieldController<bool>? q05ValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for q09 widget.
  String? q09Value1;
  FormFieldController<String>? q09ValueController1;
  // State field(s) for q10 widget.
  bool? q10Value;
  FormFieldController<bool>? q10ValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for q12 widget.
  bool? q12Value;
  FormFieldController<bool>? q12ValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for q14 widget.
  String? q14Value;
  FormFieldController<String>? q14ValueController;
  // State field(s) for q09 widget.
  String? q09Value2;
  FormFieldController<String>? q09ValueController2;
  // State field(s) for q16 widget.
  bool? q16Value;
  FormFieldController<bool>? q16ValueController;
  // State field(s) for q18 widget.
  bool? q18Value;
  FormFieldController<bool>? q18ValueController;
  // State field(s) for q21 widget.
  String? q21Value;
  FormFieldController<String>? q21ValueController;
  // State field(s) for q22 widget.
  String? q22Value;
  FormFieldController<String>? q22ValueController;
  // State field(s) for q23 widget.
  bool? q23Value;
  FormFieldController<bool>? q23ValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for q09 widget.
  String? q09Value3;
  FormFieldController<String>? q09ValueController3;
  // State field(s) for q27 widget.
  bool? q27Value;
  FormFieldController<bool>? q27ValueController;
  // State field(s) for q30 widget.
  String? q30Value;
  FormFieldController<String>? q30ValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    alturaFocusNode?.dispose();
    alturaTextController?.dispose();

    pesoFocusNode?.dispose();
    pesoTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController3?.dispose();

    textFieldFocusNode2?.dispose();
    textController4?.dispose();

    textFieldFocusNode3?.dispose();
    textController5?.dispose();

    textFieldFocusNode4?.dispose();
    textController6?.dispose();

    textFieldFocusNode5?.dispose();
    textController7?.dispose();

    textFieldFocusNode6?.dispose();
    textController8?.dispose();
  }
}
