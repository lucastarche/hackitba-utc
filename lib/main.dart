import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hackitba_utc/login/login_screen.dart';
import 'package:hackitba_utc/page_view/page_view.dart';
import 'package:redux/redux.dart';

import 'redux/store_content.dart';
import 'redux/reducer.dart';

void main() {
  final store = Store<StoreContent>(mainReducer,
      initialState: StoreContent(
        users: [
          User(email: "ulilopezpacho@gmail.com", password: "abc", isAdmin: false),
          User(email: "lucastarche@gmail.com", password: "abc", isAdmin: true),
        ],
        webPages: [
          WebPageElement(url: "https://www.google.com", title: "Google"),
          WebPageElement(url: "https://www.youtube.com", title: "Youtube"),
          WebPageElement(url: "https://www.instagram.com", title: "Instagram"),
          WebPageElement(url: "https://www.netflix.com", title: "Netflix"),
          WebPageElement(url: "https://www.bancogalicia.com", title: "Banco Galicia"),
          WebPageElement(url: "https://mobile.twitter.com", title: "Twitter"),
          WebPageElement(url: "https://es.m.wikipedia.org", title: "Wikipedia"),
        ],
      ));

  runApp(
    StoreProvider<StoreContent>(
      store: store,
      child: MaterialApp(
        home: const LoginScreen(),
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
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: ((context) => WebPageView(
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
                    RegExp(r"^https://accounts.google.com"),
                    RegExp(r"^about:blank$")
                  ],
                  controller: Completer(),
                  isError: true,
                )),
          );
        },
      ),
    ),
  );
}
