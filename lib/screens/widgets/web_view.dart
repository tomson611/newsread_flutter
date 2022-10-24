import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '/../src/navigation_controls.dart';
import '/../src/web_view_stack.dart';

class WebView extends StatefulWidget {
  const WebView({required this.url, required this.title, super.key});

  final String url;
  final String title;

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          NavigationControls(controller: controller),
        ],
      ),
      body: WebViewStack(url: widget.url, controller: controller),
    );
  }
}
