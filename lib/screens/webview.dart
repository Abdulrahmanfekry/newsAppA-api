import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_webview/native_webview.dart';

class view extends StatelessWidget {

  String url;
  view(this.url);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: url,
    ),
    );
  }
}
