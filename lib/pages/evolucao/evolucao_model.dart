import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'evolucao_widget.dart' show EvolucaoWidget;
import 'package:flutter/material.dart';

class EvolucaoModel extends FlutterFlowModel<EvolucaoWidget> {
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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  Completer<List<BemEstarRow>>? requestCompleter;
  DateTime? datePicked1;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks.
  Future getSintomas(BuildContext context) async {
    ApiCallResponse? apiResultjzhl;

    apiResultjzhl = await GetSintomasPlotCall.call(
      initDate: '2024-05-01',
      endDate: '2024-06-28',
      pId: FFAppState().paciente.id,
    );

    sintData = ((apiResultjzhl.jsonBody ?? '')
            .toList()
            .map<ColumnChartDataStruct?>(ColumnChartDataStruct.maybeFromMap)
            .toList() as Iterable<ColumnChartDataStruct?>)
        .withoutNulls
        .toList()
        .cast<ColumnChartDataStruct>();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
