import 'package:flutter/material.dart';

class ShowDetail extends StatelessWidget {
  final String xAxis;
  final String chartType;
  final double number;
  final bool left;
  ShowDetail({this.xAxis, this.chartType, this.number, this.left = true});
  @override
  Widget build(BuildContext context) {
    var style = TextStyle(color: Colors.white, fontSize: 10);
    // var position = left ? {'left': 0} : {'right': -10};
    return Positioned(
      right: left ? null : -10,
      left: left ? 50 : null,
      child: Container(
          width: 125,
          // height: 35,
          color: Color.fromRGBO(0, 0, 0, 0.7),
          padding: EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                xAxis,
                style: style,
              ),
              Container(
                width: 165,
                height: 15,
                child: Stack(
                  children: [
                    Positioned(
                      child: new CustomPaint(
                          size: new Size(13, 13), painter: new MyPainter()),
                    ),
                    Positioned(
                        left: 10,
                        child: Text(
                          chartType,
                          style: style,
                        )),
                    Positioned(
                      right: 1,
                      child: Text(
                        number.toString(),
                        style: style,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

//小点点
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()
      ..colorFilter = ColorFilter.mode(
          Color.fromARGB(243, 190, 35, 1), BlendMode.srcATop) //颜色渲染模式
      ..filterQuality = FilterQuality.high; //颜色渲染模式的质量
    canvas.drawCircle(new Offset(6, 8), 4, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
