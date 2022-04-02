import 'dart:async';

import 'package:flutter/material.dart';
import 'page_view/page_view.dart';

void main() {
  runApp(
    MaterialApp(
      home: WebPageView(
        validUrls: [
          RegExp(r'^https://flutter.dev'),
          RegExp(r'^https://www.google.com'),
          RegExp(r'^https://www.youtube.com'),
          RegExp(r'^https://www.facebook.com'),
          RegExp(r'^https://www.instagram.com'),
          RegExp(r'^https://www.twitter.com'),
        ],
        controller: Completer(),
      ),
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.all(15),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.all(15),
            ),
          ),
        ),
      ),
    ),
  );
}
