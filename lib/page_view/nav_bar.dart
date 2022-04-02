import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget generateNavigationBar(
    BuildContext context, Completer<WebViewController> controller) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(2, 0, 2, 15),
    child: Row(
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
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                    height: 800,
                    child: GridView.count(crossAxisCount: 4, children: [
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
                      _generateNavigationButton(
                        controller,
                        "assets/logo_bancogalicia.png",
                        "https://www.bancogalicia.com",
                      ),
                      _generateNavigationButton(
                        controller,
                        "assets/logo_twitter.png",
                        "https://www.twitter.com",
                      ),
                      _generateNavigationButton(
                        controller,
                        "assets/logo_youtube.png",
                        "https://m.youtube.com",
                      ),
                      _generateNavigationButton(
                        controller,
                        "assets/logo_wikipedia.png",
                        "https://es.m.wikipedia.org",
                      ),
                    ]));
              },
            );
          },
        ),
      ],
    ),
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
