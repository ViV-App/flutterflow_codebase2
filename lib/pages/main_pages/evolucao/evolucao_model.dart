import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/custom_date_picker_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'evolucao_widget.dart' show EvolucaoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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

  int queixa = 14;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (getLatestBemViverScore)] action in evolucao widget.
  ApiCallResponse? scoreHas;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - Query Rows] action in evolucao widget.
  List<StaticQueixasSaudeRow>? queix;
  // Stores action output result for [Backend Call - API (tracking)] action in Icon widget.
  ApiCallResponse? apiResult38y;
  // Stores action output result for [Backend Call - API (tracking)] action in Icon widget.
  ApiCallResponse? apiResult38yz;
  // Stores action output result for [Backend Call - API (tracking)] action in Container widget.
  ApiCallResponse? apiResult38yfd;

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

    sintData = ((sints?.jsonBody ?? '')
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
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
