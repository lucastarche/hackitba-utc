import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

AppBar generateAppBar(Completer<WebViewController> controller) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: const Text("EasyWeb"),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () async {
          final webViewController = await controller.future;
          webViewController.goBack();
        },
      ),
      IconButton(
        icon: const Icon(Icons.arrow_forward),
        onPressed: () async {
          final webViewController = await controller.future;
          webViewController.goForward();
        },
      ),
      IconButton(
        icon: const Icon(Icons.refresh),
        onPressed: () async {
          final webViewController = await controller.future;
          webViewController.reload();
        },
      ),
    ],
  );
}
