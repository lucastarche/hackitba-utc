import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

AppBar generateAppBar(Completer<WebViewController> controller) {
  return AppBar(
    title: const Text("Granny Granny Go"),
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
      //Add reload button
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
