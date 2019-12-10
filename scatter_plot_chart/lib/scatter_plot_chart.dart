import 'package:flutter/material.dart';
import 'dart:math';

final List listData = [
  {
    "duration": 0,
    "times": 1,
    "name": "意",
  },
  {
    "duration": 0,
    "times": 1,
    "name": "世",
  },
  {
    "duration": 83265,
    "times": 1,
    "name": "有",
  },
  {
    "duration": 83265,
    "times": 1,
    "name": "的",
  },
  {
    "duration": 0,
    "times": 1,
    "name": "界",
  },
];

class CustomPaintRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: Size(300, 300), //指定画布大小
        painter: MyPainter(), // 背景画笔，会显示在子节点后面
      ),
    );
  }
}

class MyBackPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..color = Colors.grey[100]; //背景为纸黄色
    canvas.drawRect(Offset.zero & size, paint);

    paint
      ..style = PaintingStyle.stroke //线
      ..color = Colors.white
      ..strokeWidth = 1.0;
  }

  //在实际场景中正确利用此回调可以避免重绘开销
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    _myDrawCircle(double offsetX, double offsetY, double radius, Paint paint) {
      canvas.drawCircle(
        Offset(offsetX, offsetY),
        radius,
        paint,
      );
    }

    for (int i = 0; i <= listData.length; ++i) {
      paint
        ..style = PaintingStyle.fill
        ..color = Colors.lightBlue;
      if (i == 0) {
        _myDrawCircle(50.0, 50.0, 10.0, paint);
      } else {
        _myDrawCircle(50.0 + 50 * i, 50, 10.0, paint);
      }
    }
  }

  //在实际场景中正确利用此回调可以避免重绘开销
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
