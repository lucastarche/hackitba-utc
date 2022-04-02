import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget generateNavigationBar(Completer<WebViewController> controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _generateNavigationButton(
        controller,
        "assets/logo_google.png",
        "https://www.google.com",
      ),
      _generateNavigationButton(
        controller,
        "assets/logo_facebook.png",
        "https://m.facebook.com",
      ),
      _generateNavigationButton(
        controller,
        "assets/logo_instagram.png",
        "https://www.instagram.com",
      ),
      _generateNavigationButton(
        controller,
        "assets/logo_gmail.png",
        "https://mail.google.com",
      ),
      _generateNavigationButton(
        controller,
        "assets/logo_netflix.png",
        "https://www.netflix.com",
      ),
      IconButton(
        icon: Icon(Icons.add),
        onPressed: () {},
      )
    ],
  );
}

IconButton _generateNavigationButton(
  Completer<WebViewController> controller,
  String iconPath,
  String url,
) {
  return IconButton(
    onPressed: () async {
      final webViewController = await controller.future;
      webViewController.loadUrl(url);
    },
    icon: Image.asset(iconPath),
    iconSize: 50,
  );
}
