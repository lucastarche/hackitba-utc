import 'package:flutter/material.dart';
import 'package:hackitba_utc/login/login_screen.dart';
import 'package:redux/redux.dart';

import 'redux/store_content.dart';
import 'redux/reducer.dart';

void main() {
  final store = Store<StoreContent>(mainReducer,
      initialState: StoreContent(
        users: [
          User(email: "ulilopezpacho@gmail.com", password: "@dminito2"),
        ],
      ));

  runApp(
    MaterialApp(
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
    ),
  );
}
