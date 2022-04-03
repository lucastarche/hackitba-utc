import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hackitba_utc/page_view/app_bar.dart';
import 'package:hackitba_utc/page_view/nav_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../api/phishing_api.dart';

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
  bool isLoading = true;
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
      bottomNavigationBar: CustomNavigationBar(
        controller: widget.controller,
        onNavigateStart: () => setState(() => isLoading = true),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://www.google.com',
            onWebViewCreated: (webViewController) {
              widget.controller.complete(webViewController);
              if (widget.isError) {
                _showInvalidPage(context);
              }
            },
            onPageStarted: (_) => setState(() => isLoading = true),
            onPageFinished: (_) => setState(() => isLoading = false),
            navigationDelegate: (request) async {
              setState(() => isLoading = true);

              for (final url in widget.validUrls) {
                if (url.hasMatch(request.url)) {
                  if (url.hasMatch("https://www.netflix.com")) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                        content: const Text(
                          "Tu usuario es \"sandrita123\", y tu contraseña es \"bc7@eb2kl(ad1!5\"",
                          style: TextStyle(fontSize: 20),
                        ),
                        action: SnackBarAction(
                            label: "OK",
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            }),
                        duration: const Duration(days: 1000),
                      ));
                  }
                  return NavigationDecision.navigate;
                }
              }

              if (await isSafeURL(request.url)) {
                return NavigationDecision.navigate;
              }

              _showInvalidPage(context);
              return NavigationDecision.prevent;
            },
            javascriptMode: JavascriptMode.unrestricted,
          ),
          isLoading
              ? Center(
                  child: Container(
                      padding: EdgeInsets.all(50),
                      decoration: BoxDecoration(color: Color(0x80000000)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 20),
                          Text(
                            "Verificando si la página es segura...",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
                )
              : const Center(),
        ],
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
