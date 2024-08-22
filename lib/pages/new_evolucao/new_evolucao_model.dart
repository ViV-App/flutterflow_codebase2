import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'new_evolucao_widget.dart' show NewEvolucaoWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewEvolucaoModel extends FlutterFlowModel<NewEvolucaoWidget> {
  ///  Local state fields for this page.

  DateTime? dataInicio;

  DateTime? dataFinal;

  List<ColumnChartDataStruct> sintData = [];
  void addToSintData(ColumnChartDataStruct item) => sintData.add(item);
  void removeFromSintData(ColumnChartDataStruct item) => sintData.remove(item);
  void removeAtIndexFromSintData(int index) => sintData.removeAt(index);
  void insertAtIndexInSintData(int index, ColumnChartDataStruct item) =>
      sintData.insert(index, item);
  void updateSintDataAtIndex(
          int index, Function(ColumnChartDataStruct) updateFn) =>
      sintData[index] = updateFn(sintData[index]);

  int queixa = 14;

  ///  State fields for stateful widgets in this page.

  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - Query Rows] action in newEvolucao widget.
  List<StaticQueixasSaudeRow>? queix;
  DateTime? datePicked1;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks.
  Future getSintomas(BuildContext context) async {
    ApiCallResponse? sints;

    sints = await GetAgreggatedSintomasCall.call(
      dataInit: dateTimeFormat(
        "y-M-d",
        dataInicio,
        locale: FFLocalizations.of(context).languageCode,
      ),
      dataEnd: dateTimeFormat(
        "y-M-d",
        dataFinal,
        locale: FFLocalizations.of(context).languageCode,
      ),
      paciente: FFAppState().paciente.id,
    );

    sintData = ((sints.jsonBody ?? '')
            .toList()
            .map<ColumnChartDataStruct?>(ColumnChartDataStruct.maybeFromMap)
            .toList() as Iterable<ColumnChartDataStruct?>)
        .withoutNulls
        .toList()
        .cast<ColumnChartDataStruct>();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}