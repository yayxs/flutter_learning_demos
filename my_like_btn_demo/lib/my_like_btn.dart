import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class MyLikeBtn extends StatefulWidget {
  MyLikeBtn({Key key}) : super(key: key);

  @override
  _MyLikeBtnState createState() => _MyLikeBtnState();
}

class _MyLikeBtnState extends State<MyLikeBtn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Center(
            child: LikeButton(),
          ),
        ));
  }
}
