// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
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

class NewBarChart extends StatefulWidget {
  const NewBarChart({
    super.key,
    this.width,
    this.height,
    required this.chartData,
  });

  final double? width;
  final double? height;
  final List<ColumnChartDataStruct> chartData;

  @override
  State<NewBarChart> createState() => _NewBarChartState();
}

class _NewBarChartState extends State<NewBarChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height ?? MediaQuery.of(context).size.height,
      child: SfCartesianChart(
        margin: EdgeInsets.zero, // Remove all margins
        plotAreaBorderWidth: 0, // Remove the border around the plot area
        plotAreaBorderColor:
            Colors.transparent, // Ensure the border is transparent
        primaryXAxis: CategoryAxis(
          labelStyle: TextStyle(
            color: Colors.transparent,
          ),
          axisLine: AxisLine(color: Colors.transparent),
          majorTickLines: MajorTickLines(size: 0),
          plotOffset: 0, // Remove any offset
          isVisible: false, // Ensure the axis itself is invisible
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
          isVisible: false, // Ensure the axis itself is invisible
        ),
        tooltipBehavior: TooltipBehavior(
          enable: true,
          color: Color(0xFF6E78FF),
          textStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        series: <CartesianSeries<ColumnChartDataStruct, String>>[
          BarSeries<ColumnChartDataStruct, String>(
            dataSource: widget.chartData,
            xValueMapper: (ColumnChartDataStruct data, _) => data.sintoma,
            yValueMapper: (ColumnChartDataStruct data, _) => data.count,
            name: 'Sintoma',
            color: Color(0xFF6E78FF),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              labelAlignment: ChartDataLabelAlignment.bottom,
              builder: (dynamic data, dynamic point, dynamic series,
                  int pointIndex, int seriesIndex) {
                return Text(data.sintoma,
                    style: TextStyle(color: Colors.white));
              },
            ),
          ),
        ],
      ),
    );
  }
}
