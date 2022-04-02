import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Granny Granny Go!"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Bienvenido',
                  style: TextStyle(
                    fontSize: 60,
                  ),
                ),
                SizedBox(height: 100),
                _buildButtonList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text(
            "Inicia sesión",
            style: TextStyle(fontSize: 30),
          ),
        ),
        SizedBox(height: 20),
        OutlinedButton(
          onPressed: () {},
          child: Text(
            "Registrarse",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ],
    );
  }
}
