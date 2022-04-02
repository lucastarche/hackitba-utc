import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          RaisedButton(
            child: Text('Login'),
            onPressed: () {
              
            },
          ),
        ],
      ),
    );
  }
}
