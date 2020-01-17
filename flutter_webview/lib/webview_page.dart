import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  WebViewPage({Key key}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  // WebViewController是您通过Flutter编程修改WebView或访问诸如当前显示的URL之类的属性的票证。
  WebViewController _controller; // 控制器
  // Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(),
      body: WebView(
        // web view 创建完成时调用
        /// 使用javascriptChannel JS可以调用Flutter
        /// 通过WebViewController调用evaluateJavascript方法，即可调用JS
        // onWebViewCreated: (WebViewController webViewController) {
        //   _controller.complete(webViewController); // 获取实例
        // },
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
        // http://localhost:3000/jsFlutter.html
        initialUrl: 'http://192.168.13.233:3000/jsFlutter.html',
        javascriptMode: JavascriptMode.unrestricted, // 启动js

        onPageFinished: (url) {
          _controller.evaluateJavascript("document.title").then((result) {
            print('${result}');
          });
        },
      ));
}
