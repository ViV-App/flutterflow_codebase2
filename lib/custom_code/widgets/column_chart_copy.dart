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

class ColumnChartCopy extends StatefulWidget {
  const ColumnChartCopy({
    super.key,
    this.width,
    this.height,
    required this.chartData,
  });

  final double? width;
  final double? height;
  final List<ColumnChartDataStruct> chartData;

  @override
  State<ColumnChartCopy> createState() => _ColumnChartCopyState();
}

class _ColumnChartCopyState extends State<ColumnChartCopy> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        labelStyle: TextStyle(
          color: Colors.transparent,
        ),
        axisLine: AxisLine(color: Colors.transparent),
        majorTickLines: MajorTickLines(size: 0),
      ),
      primaryYAxis: NumericAxis(
        labelStyle: TextStyle(
          color: Colors.transparent,
        ),
        axisLine: AxisLine(color: Colors.transparent),
        majorGridLines: MajorGridLines(
          color: Colors.transparent,
        ),
        majorTickLines: MajorTickLines(size: 0),
      ),
      tooltipBehavior: TooltipBehavior(
        enable: true,
        color: Color(0xFF3E51B5),
        textStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      series: <CartesianSeries<ColumnChartDataStruct, String>>[
        ColumnSeries<ColumnChartDataStruct, String>(
          dataSource: widget.chartData,
          xValueMapper: (ColumnChartDataStruct data, _) => data.sintoma,
          yValueMapper: (ColumnChartDataStruct data, _) => data.count,
          name: 'Sintoma',
          color: Color(0xFF3E51B5),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ],
    );
  }
}
