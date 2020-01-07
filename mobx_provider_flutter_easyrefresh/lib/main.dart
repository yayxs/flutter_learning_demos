import 'package:flutter/material.dart';
import 'package:mobx_provider_flutter_easyrefresh/pages/home_page.dart';
import 'package:mobx_provider_flutter_easyrefresh/stores/home_store.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        Provider<HomeStore>(
          create: (_) => HomeStore(),
        ),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
