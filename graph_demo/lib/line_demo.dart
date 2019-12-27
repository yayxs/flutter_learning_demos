/// Example of a simple line chart.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory SimpleLineChart.withSampleData() {
    return new SimpleLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }
  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;
    print(selectedDatum.first.datum.year);
    print(selectedDatum.first.datum.sales);
    print(selectedDatum.first.series.displayName);
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(
      seriesList,
      animate: animate,
      defaultRenderer: charts.LineRendererConfig(
        // 折线图绘制的配置
        includeArea: true,
        includePoints: true,
        includeLine: true,
        stacked: false,
      ),
      domainAxis: charts.NumericAxisSpec(
        // // 主轴的配置
        // tickFormatterSpec: DomainFormatterSpec(
        //     widget.dateRange), // tick 值的格式化，这里把 num 转换成 String
        renderSpec: charts.SmallTickRendererSpec(
          // 主轴绘制的配置
          tickLengthPx: 0, // 刻度标识突出的长度
          labelOffsetFromAxisPx: 12, // 刻度文字距离轴线的位移
          labelStyle: charts.TextStyleSpec(
              // 刻度文字的样式
              // color: ChartUtil.getChartColor(HColors.lightGrey),
              // fontSize: HFontSizes.smaller.toInt(),
              ),
          axisLineStyle: charts.LineStyleSpec(
              // 轴线的样式
              // color: ChartUtil.getChartColor(ChartUtil.lightBlue),
              ),
        ),
        tickProviderSpec: charts.BasicNumericTickProviderSpec(
          // 轴线刻度配置
          dataIsInWholeNumbers: false,
          // desiredTickCount: widget.data.length, // 期望显示几个刻度
        ),
      ),
      primaryMeasureAxis: charts.NumericAxisSpec(
        // 交叉轴的配置，参数参考主轴配置
        showAxisLine: false, // 显示轴线
        // tickFormatterSpec: MeasureFormatterSpec(),
        tickProviderSpec: charts.BasicNumericTickProviderSpec(
          dataIsInWholeNumbers: false,
          desiredTickCount: 4,
        ),
        renderSpec: charts.GridlineRendererSpec(
          // 交叉轴刻度水平线
          tickLengthPx: 0,
          labelOffsetFromAxisPx: 12,
          labelStyle: charts.TextStyleSpec(
              // color: ChartUtil.getChartColor(HColors.lightGrey),
              // fontSize: HFontSizes.smaller.toInt(),
              ),
          lineStyle: charts.LineStyleSpec(
              // color: ChartUtil.getChartColor(ChartUtil.lightBlue),
              ),
          axisLineStyle: charts.LineStyleSpec(
              // color: ChartUtil.getChartColor(ChartUtil.lightBlue),
              ),
        ),
      ),
      selectionModels: [
        // 设置点击选中事件
        charts.SelectionModelConfig(
          type: charts.SelectionModelType.info,
          changedListener: _onSelectionChanged,
        )
      ],
      behaviors: [
        charts.InitialSelection(selectedDataConfig: [
          // 设置默认选中
          charts.SeriesDatumConfig<num>('LineChart', 2)
        ]),
      ],
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 100),
      new LinearSales(3, 75),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
