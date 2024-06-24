// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChart extends StatefulWidget {
  const ColumnChart({
    super.key,
    this.width,
    this.height,
    required this.chartData,
  });

  final double? width;
  final double? height;
  final List<ColumnChartDataStruct> chartData;

  @override
  State<ColumnChart> createState() => _ColumnChartState();
}

class _ColumnChartState extends State<ColumnChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CartesianSeries<ColumnChartDataStruct, String>>[
          ColumnSeries<ColumnChartDataStruct, String>(
              dataSource: widget.chartData,
              xValueMapper: (ColumnChartDataStruct data, _) => data.sintoma,
              yValueMapper: (ColumnChartDataStruct data, _) => data.count,
              name: 'Sintoma',
              color: Color.fromARGB(255, 127, 8, 255))
        ]));
  }
}
