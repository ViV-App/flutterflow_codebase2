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
import 'package:intl/intl.dart'; // Usado para formatar a data

class DynamicLineChart extends StatefulWidget {
  const DynamicLineChart({
    super.key,
    this.width,
    this.height,
    required this.dates, // Lista de datas (DateTime)
    required this.values, // Lista de valores (double)
  });

  final double? width;
  final double? height;
  final List<DateTime> dates; // Eixo X - Datas
  final List<double> values; // Eixo Y - Valores

  @override
  State<DynamicLineChart> createState() => _DynamicLineChartState();
}

class _DynamicLineChartState extends State<DynamicLineChart> {
  @override
  Widget build(BuildContext context) {
    // Converter as listas de datas e valores em uma lista de dados do gráfico
    final List<ChartData> chartData = List.generate(
      widget.dates.length,
      (index) => ChartData(widget.dates[index], widget.values[index]),
    );

    // Capturar o último ponto
    final ChartData lastPoint = chartData.last;

    // Lista de pontos anteriores ao último
    final List<ChartData> previousPoints =
        chartData.sublist(0, chartData.length - 1);

    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height ?? 300,
      child: SfCartesianChart(
        primaryXAxis: DateTimeAxis(
          labelStyle: TextStyle(
              color: Colors.transparent,
              fontSize: 0), // Torna as labels invisíveis

          // Aqui, usamos uma função que formata a data conforme os dados fornecidos
          intervalType: DateTimeIntervalType.days,
          dateFormat: DateFormat('dd/MM'), // Formato que exibe dia/mês
          interval: 1, // Garantir que cada ponto de dados seja exibido
          visibleMinimum: widget.dates.first,
          visibleMaximum: widget.dates.last,
          majorGridLines:
              MajorGridLines(width: 1), // Mostrar grades verticais no eixo X
        ),
        primaryYAxis: NumericAxis(
          isVisible: true, // Exibir o eixo Y
          majorGridLines:
              MajorGridLines(width: 1), // Mostrar grades horizontais no eixo Y
          minimum: 0, // Definir o valor mínimo como 0
          maximum: 4, // Definir o valor máximo como 4
        ),
        series: <CartesianSeries>[
          // Linha principal com preenchimento abaixo para todos os pontos
          AreaSeries<ChartData, DateTime>(
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.date,
            yValueMapper: (ChartData data, _) => data.value,
            color: Color(0xFF6E78FF)
                .withOpacity(0.3), // Cor com opacidade para o preenchimento
            borderColor: Color(0xFF6E78FF), // Cor da linha
            borderWidth: 2, // Espessura da linha
          ),
          // Pontos anteriores com bolinhas brancas e bordas roxas
          LineSeries<ChartData, DateTime>(
            dataSource: previousPoints, // Somente pontos anteriores ao último
            xValueMapper: (ChartData data, _) => data.date,
            yValueMapper: (ChartData data, _) => data.value,
            markerSettings: MarkerSettings(
              isVisible: true,
              width: 8, // Tamanho menor para os pontos anteriores
              height: 8,
              shape: DataMarkerType.circle,
              borderColor: Color(0xFF6E78FF), // Cor da borda (mesma da linha)
              borderWidth: 3, // Bordas mais grossas para diferenciar
              color: Colors.white, // Cor interna branca
            ),
            color: Colors
                .transparent, // Linha transparente para focar apenas nas bolinhas
          ),
          // Série adicional para o último ponto destacado
          ScatterSeries<ChartData, DateTime>(
            dataSource: [lastPoint], // Apenas o último ponto
            xValueMapper: (ChartData data, _) => data.date,
            yValueMapper: (ChartData data, _) => data.value,
            color: Color(0xFF4B52CC), // Cor mais escura para o último ponto
            markerSettings: MarkerSettings(
              isVisible: true,
              width: 15, // Tamanho maior para o último ponto
              height: 15,
              shape: DataMarkerType.circle,
              borderColor: Color(0xFF4B52CC), // Cor da borda do último ponto
              borderWidth: 2,
            ),
          ),
        ],
      ),
    );
  }
}

// Classe auxiliar para armazenar os dados do gráfico
class ChartData {
  ChartData(this.date, this.value);

  final DateTime date;
  final double value;
}
