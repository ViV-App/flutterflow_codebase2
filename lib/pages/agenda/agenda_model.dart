import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'agenda_widget.dart' show AgendaWidget;
import 'package:flutter/material.dart';

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

  final unfocusNode = FocusNode();
  DateTime? datePicked;
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
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks.
  Future activeLottie(BuildContext context) async {
    if (consumo.length == consumoQntd) {
    } else {
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

    returnedAgenda = await GetCall.call(
      date: date,
      cliente: FFAppState().paciente.id,
    );

    consumo = ((returnedAgenda.jsonBody ?? '')
            .toList()
            .map<AgendaStruct?>(AgendaStruct.maybeFromMap)
            .toList() as Iterable<AgendaStruct?>)
        .withoutNulls
        .toList()
        .cast<AgendaStruct>();
    consumoQntd = consumo.where((e) => e.consumido == true).toList().length;
  }
}
