import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'redux/store_content.dart';
import 'redux/reducer.dart';
import 'page_view/page_view.dart';

void main() {
  final store = Store<StoreContent>(mainReducer,
      initialState: StoreContent(
        users: [
          User(email: "ulilopezpacho@gmail.com", password: "@dminito2"),
        ],
      ));

  runApp(
    MaterialApp(
      home: WebPageView(
        validUrls: [
          RegExp(r"^https://m.facebook.com"),
          RegExp(r"^https://mail.google.com"),
          RegExp(r"^https://www.google.com"),
          RegExp(r"^https://www.instagram.com"),
          RegExp(r"^https://www.netflix.com"),
          RegExp(r"^https://www.bancogalicia.com"),
          RegExp(r"^https://mobile.twitter.com"),
          RegExp(r"^https://m.youtube.com"),
          RegExp(r"^https://es.m.wikipedia.org"),
        ],
        controller: Completer(),
      ),
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(15),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(15),
            ),
          ),
        ),
      ),
    ),
  );
}
