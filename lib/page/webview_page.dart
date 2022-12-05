import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webviewpage extends StatelessWidget {
  final String url;
  Webviewpage(this.url); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News App')),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
