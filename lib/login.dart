import 'package:flutter/material.dart';

void main() => runApp(const NasaApp());

class NasaApp extends StatelessWidget {
  const NasaApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var title = 'Nasa api';
    return MaterialApp(
      title: title,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Stack(children: <Widget>[
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[Colors.cyan, Colors.red],
                ),
              ),
              child: Image.asset('assets/images/17_earth.png'),
            ),
            Container(
              padding: const EdgeInsets.all(30.0),
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 160),
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Usuari"),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Contrasenya"),
                    obscureText: true,
                  ),
                  SizedBox(height: 60),
                  ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {

                    },
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
