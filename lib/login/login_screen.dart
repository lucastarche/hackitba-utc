import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hackitba_utc/page_view/page_view.dart';

import '../redux/store_content.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  "¡Bienvenido a Easy Web!",
                  style: TextStyle(fontSize: 40),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(fontSize: 20),
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor introducí algún texto';
                    }
                    return value.contains("@") ? null : "Mail inválido";
                  },
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(fontSize: 20),
                    labelText: 'Contraseña',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor introducí algún texto';
                    }
                    return value.length > 3
                        ? null
                        : "Introducí al menos tres caracteres";
                  },
                  style: const TextStyle(fontSize: 20),
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                    child:
                        const Text('Acceder', style: TextStyle(fontSize: 24)),
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;
                      final userExists = StoreProvider.of<StoreContent>(context)
                          .state
                          .users
                          .any((element) =>
                              element.email == _emailController.text &&
                              element.password == _passwordController.text);

                      if (!userExists) return;

                      if (Navigator.canPop(context)) Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WebPageView(
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
                          ),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
