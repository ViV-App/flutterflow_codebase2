import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/custom_date_picker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'agenda_widget.dart' show AgendaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AgendaModel extends FlutterFlowModel<AgendaWidget> {
  ///  Local state fields for this page.

  List<AgendaStruct> consumo = [];
  void addToConsumo(AgendaStruct item) => consumo.add(item);
  void removeFromConsumo(AgendaStruct item) => consumo.remove(item);
  void removeAtIndexFromConsumo(int index) => consumo.removeAt(index);
  void insertAtIndexInConsumo(int index, AgendaStruct item) =>
      consumo.insert(index, item);
  void updateConsumoAtIndex(int index, Function(AgendaStruct) updateFn) =>
      consumo[index] = updateFn(consumo[index]);

  bool lottieOn = false;

  DateTime? pickedDate;

  int? consumoQntd;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox widget.
  Map<AgendaStruct, bool> checkboxValueMap = {};
  List<AgendaStruct> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Stores action output result for [Backend Call - Insert Row] action in Checkbox widget.
  ConsumotrackRow? outputConsumo02amCopy;
  // Stores action output result for [Backend Call - Insert Row] action in Icon widget.
  ConsumotrackRow? outputConsumo02amCopyCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future activeLottie(BuildContext context) async {
    if (consumo.length != consumoQntd) {
      lottieOn = true;
      await Future.delayed(const Duration(milliseconds: 1500));
      lottieOn = false;
    }
  }

  Future getAgenda(
    BuildContext context, {
    String? date,
  }) async {
    ApiCallResponse? returnedAgenda;

    returnedAgenda = await GetAgendaCall.call(
      date: date,
      cliente: FFAppState().paciente.id,
    );

    consumo = ((returnedAgenda?.jsonBody ?? '')
            .toList()
            .map<AgendaStruct?>(AgendaStruct.maybeFromMap)
            .toList() as Iterable<AgendaStruct?>)
        .withoutNulls
        .toList()
        .cast<AgendaStruct>();
    consumoQntd = consumo.where((e) => e.consumido == true).toList().length;
  }
}
