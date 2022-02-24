import 'package:flutter/material.dart';
import 'package:nasa_api/fetchData.dart';
import 'package:nasa_api/screens/login.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var title = 'Nasa api';
    return MaterialApp(
      title: title,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Stack(children: <Widget>[
            Container(
              child: ElevatedButton(
                child: const Text('Go back'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.5,
              decoration: BoxDecoration(
                  image: new DecorationImage(
                      image: NetworkImage(
                          'https://apod.nasa.gov/apod/image/2202/Chamaeleon_RobertEder.jpg'), // Space image
                      fit: BoxFit.cover)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 275),
              width: double.infinity,
              height: (size.height * 0.5) + 275,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Text("title"),
                    SizedBox(height: 20),
                    Text("autor"),
                    Text("data"),
                    SizedBox(height: 20),
                    Text("descripció"),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
