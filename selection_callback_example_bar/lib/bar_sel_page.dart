import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import './show_detail_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Test extends StatefulWidget {
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  String year;
  int sales;
  bool flag = false; // 定义是否点击
  //点击柱状图触发的函数
  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;
    print(selectedDatum.first.datum.year);
    print(selectedDatum.first.datum.sales);
    print(selectedDatum.first.series.displayName);
    setState(() {
      // 改变标记状态
      flag = true;
      //改变两个显示的数值
      year = selectedDatum.first.datum.year;
      sales = selectedDatum.first.datum.sales;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(700),
      height: ScreenUtil.getInstance().setHeight(500),
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.blueAccent)),
            width: double.infinity,
            height: ScreenUtil.getInstance().setHeight(500),
            child: charts.BarChart(
              //通过下面获取数据传入
              ChartFlutterBean.createSampleData(),
              //配置项，以及设置触发的函数
              selectionModels: [
                charts.SelectionModelConfig(
                  type: charts.SelectionModelType.info,
                  changedListener: _onSelectionChanged,
                )
              ],
            ),
          ),
          _showMask(flag, 4.0)
        ],
      ),
    );
  }

  // 自定义方式显示蒙层
  _showMask(bool flag, double index) {
    var widthOffset = ScreenUtil.getInstance().setWidth(63);
    var initWidth = ScreenUtil.getInstance().setWidth(28);
    return flag == true
        ? Positioned(
            bottom: 22,
            left: initWidth * index + widthOffset,
            child: Container(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              width: ScreenUtil.getInstance().setWidth(90),
              height: ScreenUtil.getInstance().setHeight(410),
            ),
          )
        : Container();
  }
}

//一下为组合柱状图数据部分
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

class ChartFlutterBean {
  static List<charts.Series<OrdinalSales, String>> createSampleData() {
    final data = [
      new OrdinalSales('吃', 0),
      new OrdinalSales('喝', 1),
      new OrdinalSales('玩', 0),
      new OrdinalSales('乐', 11),
      new OrdinalSales('学', 28),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}
