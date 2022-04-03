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
  final _urlController = TextEditingController();

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
            onPressed: () => _displayAppList(context),
          ),
        ],
      ),
    );
  }

  void _displayAppList(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 800,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextField(
                autocorrect: false,
                controller: _urlController,
                decoration: InputDecoration(
                  hintText: "Ex: https://www.google.com",
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 3.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blueAccent, width: 3.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  _navigateTo(context, _urlController.text);
                  _urlController.clear();
                },
                child: const Text("Buscar"),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 350,
                child: GridView.count(
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
              ),
            ],
          ),
        );
      },
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
