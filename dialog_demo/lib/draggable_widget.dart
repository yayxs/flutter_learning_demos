import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  //构造函数
  const DraggableWidget({Key key}) : super(key: key);

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Offset offset = Offset(0.0, 0.0);

  @override
  void initState() {
    //初始化位置参数

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //返回一个位置控件
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
        //这里是要传给接收器的数据

        child: Container(
          width: 100.0,
          height: 100.0,
          color: Colors.pink,
        ),
        //当拖动时候的样式
        feedback: Container(
          width: 110.0,
          height: 110.0,
          color: Colors.red.withOpacity(0.5),
        ),
        //拖动完成之后的状态
        onDraggableCanceled: (Velocity velocity, Offset offset) {
          //通过 setState() 来改变
          setState(() {
            this.offset = offset;
          });
        },
      ),
    );
  }
}
