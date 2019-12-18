/// @Desc   堆叠统计图 用来展示 统计数据
/// @Author 杨万里

/// Bar chart example
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StackedBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  StackedBarChart(this.seriesList, {this.animate});

  factory StackedBarChart.withSampleData() {
    return new StackedBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.stacked,
      animationDuration: Duration.zero,
      domainAxis: new charts.OrdinalAxisSpec(
          viewport: new charts.OrdinalViewport('云平台', 4)),
      // Add the series legend behavior to the chart to turn on series legends.
      // By default the legend will display above the chart.
      behaviors: [
        new charts.SeriesLegend(),
        // 默认3000ms
        new charts.InitialHintBehavior(maxHintTranslate: 4.0),

        ///（可选）添加平移或平移和缩放行为。
        /// 如果未添加平移/缩放，则指定的视口仍为视口
        new charts.PanAndZoomBehavior(),
      ],
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<MyDataModel, String>> _createSampleData() {
    final aData = [
      new MyDataModel('云平台', 10),
      new MyDataModel('北京海淀民族小学', 5),
      new MyDataModel('云南中庆', 3),
      new MyDataModel('云南临沧市', 20),
      new MyDataModel('陕西中庆', 31),
      new MyDataModel('甘肃兰州安宁市', 25),
      new MyDataModel('北京密云', 17),
      new MyDataModel('天津河西区', 73),
      new MyDataModel('中庆云平台', 12),
      new MyDataModel('中庆云平台22', 23),
      new MyDataModel('中庆云平台333', 33),
      new MyDataModel('中庆云平台4444', 44),
      new MyDataModel('中庆云平台55555', 55),
    ];

    final bData = [
      new MyDataModel('云平台', 75),
      new MyDataModel('北京海淀民族小学', 25),
      new MyDataModel('云南中庆', 78),
      new MyDataModel('云南临沧市', 5),
      new MyDataModel('陕西中庆', 2),
      new MyDataModel('甘肃兰州安宁市', 36),
      new MyDataModel('北京密云', 42),
      new MyDataModel('天津河西区', 55),
      new MyDataModel('中庆云平台', 77),
      new MyDataModel('中庆云平台22', 7),
      new MyDataModel('中庆云平台333', 18),
      new MyDataModel('中庆云平台4444', 19),
      new MyDataModel('中庆云平台55555', 45),
    ];

    final cData = [
      new MyDataModel('云平台', 21),
      new MyDataModel('北京海淀民族小学', 25),
      new MyDataModel('云南中庆', 60),
      new MyDataModel('云南临沧市', 33),
      new MyDataModel('陕西中庆', 26),
      new MyDataModel('甘肃兰州安宁市', 71),
      new MyDataModel('北京密云', 5),
      new MyDataModel('天津河西区', 6),
      new MyDataModel('中庆云平台', 7),
      new MyDataModel('中庆云平台22', 15),
      new MyDataModel('中庆云平台333', 35),
      new MyDataModel('中庆云平台4444', 45),
      new MyDataModel('中庆云平台55555', 65),
    ];

    final dData = [
      new MyDataModel('云平台', 21),
      new MyDataModel('北京海淀民族小学', 23),
      new MyDataModel('云南中庆', 12),
      new MyDataModel('云南临沧市', 25),
      new MyDataModel('陕西中庆', 45),
      new MyDataModel('甘肃兰州安宁市', 65),
      new MyDataModel('北京密云', 71),
      new MyDataModel('天津河西区', 70),
      new MyDataModel('中庆云平台', 72),
      new MyDataModel('中庆云平台22', 47),
      new MyDataModel('中庆云平台333', 35),
      new MyDataModel('中庆云平台4444', 55),
      new MyDataModel('中庆云平台55555', 35),
    ];

    return [
      new charts.Series<MyDataModel, String>(
        id: 'A,优秀',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (MyDataModel count, _) => count.school,
        measureFn: (MyDataModel count, _) => count.count,
        data: aData,
      ),
      new charts.Series<MyDataModel, String>(
        id: 'B,良好',
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        domainFn: (MyDataModel count, _) => count.school,
        measureFn: (MyDataModel count, _) => count.count,
        data: bData,
      ),
      new charts.Series<MyDataModel, String>(
        id: 'C,合格',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (MyDataModel count, _) => count.school,
        measureFn: (MyDataModel count, _) => count.count,
        data: cData,
      ),
      new charts.Series<MyDataModel, String>(
        id: 'D,不合格',
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
        domainFn: (MyDataModel count, _) => count.school,
        measureFn: (MyDataModel count, _) => count.count,
        data: dData,
      ),
    ];
  }
}

/// Sample ordinal data type.
class MyDataModel {
  final String school; // school 学校 每一横轴点
  final int count; // 数量

  MyDataModel(this.school, this.count);
}
