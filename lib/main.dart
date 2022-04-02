import 'package:flutter/material.dart';
import 'app.dart';
import 'login/auth.dart';

void main() {
  runApp(
    MaterialApp(
      home: const LoginScreen(),
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
