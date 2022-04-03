import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hackitba_utc/page_view/app_bar.dart';
import 'package:hackitba_utc/page_view/nav_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageView extends StatefulWidget {
  final bool isError;
  final List<RegExp> validUrls;
  final Completer<WebViewController> controller;

  const WebPageView(
      {Key? key,
      this.isError = false,
      required this.validUrls,
      required this.controller})
      : super(key: key);

  @override
  State<WebPageView> createState() => _WebPageViewState();
}

class _WebPageViewState extends State<WebPageView> {
  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generateAppBar(widget.controller),
      bottomNavigationBar: CustomNavigationBar(controller: widget.controller),
      body: WebView(
        initialUrl: 'https://www.google.com',
        onWebViewCreated: (webViewController) {
          widget.controller.complete(webViewController);
          if (widget.isError) {
            _showInvalidPage(context);
          }
        },
        navigationDelegate: (request) {
          for (final url in widget.validUrls) {
            if (url.hasMatch(request.url)) {
              return NavigationDecision.navigate;
            }
          }
          _showInvalidPage(context);

          return NavigationDecision.prevent;
        },
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

  void _showInvalidPage(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Esta página es insegura\nEl administrador será notificado para revisar su seguridad.',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
  }
}
