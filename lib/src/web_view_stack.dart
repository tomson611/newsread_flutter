import 'dart:async'; // Add this import for Completer
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewStack extends StatefulWidget {
  const WebViewStack({
    required this.controller,
    required this.url,
    super.key,
  }); // Modify

  final Completer<WebViewController> controller; // Add this attribute
  final String url;

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  var loadingPercentage = 0;
 
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          initialUrl: widget.url,
          // Add from here ...
          onWebViewCreated: (webViewController) {
            widget.controller.complete(webViewController);
          },
          // ... to here.
          onPageStarted: (url) {
            setState(() {
              loadingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentage = 100;
            });
          },
          javascriptMode: JavascriptMode.unrestricted,
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
      ],
    );
  }
}
