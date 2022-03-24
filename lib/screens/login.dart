import 'package:flutter/material.dart';
import 'package:nasa_api/fetchData.dart';
import 'package:nasa_api/screens/detail.dart';
import 'package:nasa_api/fetchList.dart';
import 'package:nasa_api/apiService/ApiService.dart';

void main() {
  runApp(const MaterialApp(
    home: NasaApp(),
  ));
}

class NasaApp extends StatefulWidget {
  const NasaApp({Key? key}) : super(key: key);

  @override
  State<NasaApp> createState() => _NasaAppState();
}

class _NasaAppState extends State<NasaApp> {
  final ApiService apiService = ApiService();
  var _user = TextEditingController();
  var _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
                    controller: _user,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Contrasenya"),
                    obscureText: true,
                    controller: _pass,
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 500, left: 200),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  apiService.login(_user.text, _pass.text).then((result) {
                    if (result) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const fetchData()),
                      );
                    }
                  });
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
