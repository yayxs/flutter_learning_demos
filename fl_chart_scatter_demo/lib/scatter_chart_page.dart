import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ScatterChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScatterChartSample2State();
}

class _ScatterChartSample2State extends State {
  int touchedIndex; // 索引

  Color greyColor = Colors.grey;

  List<int> selectedSpots = []; // 选中的点

  int lastPanStartOnIndex = -1; // 最后平移开始索引

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1, // 宽高比
      child: Card(
        color: Color(0xff222222),
        child: ScatterChart(
          ScatterChartData(
              scatterSpots: [
                ScatterSpot(2, 3,
                    color: selectedSpots.contains(0) ? Colors.green : greyColor,
                    radius: 2.0 * 3),
                ScatterSpot(
                  2,
                  5,
                  color: selectedSpots.contains(1) ? Colors.yellow : greyColor,
                  radius: 18,
                ),
                ScatterSpot(
                  4,
                  5,
                  color: selectedSpots.contains(2)
                      ? Colors.purpleAccent
                      : greyColor,
                  radius: 20,
                ),
                // ScatterSpot(
                //   8,
                //   6,
                //   color: selectedSpots.contains(3) ? Colors.orange : greyColor,
                //   radius: 20,
                // ),
                // ScatterSpot(
                //   5,
                //   7,
                //   color: selectedSpots.contains(4) ? Colors.brown : greyColor,
                //   radius: 14,
                // ),
                // ScatterSpot(
                //   7,
                //   2,
                //   color: selectedSpots.contains(5)
                //       ? Colors.lightGreenAccent
                //       : greyColor,
                //   radius: 18,
                // ),
                // ScatterSpot(
                //   3,
                //   2,
                //   color: selectedSpots.contains(6) ? Colors.red : greyColor,
                //   radius: 36,
                // ),
                // ScatterSpot(
                //   2,
                //   8,
                //   color:
                //       selectedSpots.contains(7) ? Colors.tealAccent : greyColor,
                //   radius: 22,
                // ),
              ],
              minX: 0,
              maxX: 10,
              minY: 0,
              maxY: 10,
              borderData: FlBorderData(
                show: false,
              ),
              gridData: FlGridData(
                show: true,
                drawHorizontalGrid: true,
                checkToShowHorizontalGrid: (value) => true,
                getDrawingHorizontalGridLine: (value) =>
                    FlLine(color: Colors.white.withOpacity(0.1)),
                drawVerticalGrid: true,
                checkToShowVerticalGrid: (value) => true,
                getDrawingVerticalGridLine: (value) =>
                    FlLine(color: Colors.white.withOpacity(0.1)),
              ),
              titlesData: const FlTitlesData(
                show: false,
              ),
              showingTooltipIndicators: selectedSpots,
              scatterTouchData: ScatterTouchData(
                  enabled: true,
                  handleBuiltInTouches: false,
                  // handleBuiltInTouches: true,

                  touchTooltipData: const ScatterTouchTooltipData(
                    tooltipBgColor: Colors.black,
                  ),
                  // 触摸回调
                  touchCallback: (ScatterTouchResponse touchResponse) {
                    if (touchResponse.touchedSpotIndex != -1) {
                      print('${touchResponse.touchedSpotIndex}--索引是什么--------');
                      print('${selectedSpots}--索引是什么--------');
                    }
                    if (touchResponse.touchInput is FlPanStart) {
                      lastPanStartOnIndex = touchResponse.touchedSpotIndex;
                    } else if (touchResponse.touchInput is FlPanEnd) {
                      final FlPanEnd flPanEnd = touchResponse.touchInput;

                      if (flPanEnd.velocity.pixelsPerSecond <=
                          const Offset(4, 4)) {
                        setState(() {
                          if (selectedSpots.contains(lastPanStartOnIndex)) {
                            selectedSpots.remove(lastPanStartOnIndex);
                            // print('${selectedSpots}--111------>>>>>>>--');
                          } else {
                            selectedSpots.add(lastPanStartOnIndex);
                            // print('${selectedSpots}---222----->>>>>>>--');
                          }
                        });
                      }
                    }
                  })),
        ),
      ),
    );
  }
}
