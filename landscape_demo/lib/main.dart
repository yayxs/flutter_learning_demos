import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orientation/orientation.dart';

// https://github.com/flutter/flutter/issues/28134
void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orientation Example'),
      ),
      body: Center(child: Text('sas')),
    );
  }
}
