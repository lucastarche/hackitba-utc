import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomNavigationBar extends StatefulWidget {
  final Completer<WebViewController> controller;
  const CustomNavigationBar({Key? key, required this.controller})
      : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _generateNavigationButton(
            context,
            "assets/logo_google.png",
            "https://www.google.com",
          ),
          _generateNavigationButton(
            context,
            "assets/logo_facebook.png",
            "https://m.facebook.com",
          ),
          _generateNavigationButton(
            context,
            "assets/logo_instagram.png",
            "https://www.instagram.com",
          ),
          _generateNavigationButton(
            context,
            "assets/logo_gmail.png",
            "https://mail.google.com",
          ),
          _generateNavigationButton(
            context,
            "assets/logo_netflix.png",
            "https://www.netflix.com",
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 800,
                    child: GridView.count(
                      scrollDirection: Axis.horizontal,
                      crossAxisCount: 4,
                      children: [
                        _generateNavigationButton(
                          context,
                          "assets/logo_google.png",
                          "https://www.google.com",
                        ),
                        _generateNavigationButton(
                          context,
                          "assets/logo_facebook.png",
                          "https://m.facebook.com",
                        ),
                        _generateNavigationButton(
                          context,
                          "assets/logo_instagram.png",
                          "https://www.instagram.com",
                        ),
                        _generateNavigationButton(
                          context,
                          "assets/logo_gmail.png",
                          "https://mail.google.com",
                        ),
                        _generateNavigationButton(
                          context,
                          "assets/logo_netflix.png",
                          "https://www.netflix.com",
                        ),
                        _generateNavigationButton(
                          context,
                          "assets/logo_bancogalicia.png",
                          "https://www.bancogalicia.com",
                        ),
                        _generateNavigationButton(
                          context,
                          "assets/logo_twitter.png",
                          "https://www.twitter.com",
                        ),
                        _generateNavigationButton(
                          context,
                          "assets/logo_youtube.png",
                          "https://m.youtube.com",
                        ),
                        _generateNavigationButton(
                          context,
                          "assets/logo_wikipedia.png",
                          "https://es.m.wikipedia.org",
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  IconButton _generateNavigationButton(
    BuildContext context,
    String iconPath,
    String url,
  ) {
    return IconButton(
      onPressed: () async => _navigateTo(context, url),
      icon: Image.asset(iconPath),
      iconSize: 50,
    );
  }

  void _navigateTo(
    BuildContext context,
    String url,
  ) async {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
    final webViewController = await widget.controller.future;
    webViewController.loadUrl(url);
  }
}
