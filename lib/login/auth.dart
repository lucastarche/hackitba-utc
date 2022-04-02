import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Write two text box for username and password
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Username'),
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Password'),
            ),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () async {
                // Get the username and password
                final String username = 'username';
                final String password = 'password';

                // Login with the username and password
                final UserCredential result = await auth.signInWithEmailAndPassword(
                  email: username,
                  password: password,
                );

                // Get the user
                final User? user = result.user;

                // Check if the user is logged in
                if (user != null) {
                  debugPrint('Logged in');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
