import 'package:flutter/material.dart';
import 'package:nasa_api/fetchData.dart';
import 'package:nasa_api/screens/login.dart';
import 'package:nasa_api/apiService/ApiService.dart';
import 'package:nasa_api/model/apod.dart';
import 'package:nasa_api/apiImage.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key, required this.copyright,
                          required this.date,
                          required this.explanation,
                          required this.hdurl,
                          required this.media_type,
                          required this.service_version,
                          required this.aTitle,
                          required this.url}) : super(key: key);

  final String copyright;
  final String date;
  final String explanation;
  final String hdurl;
  final String media_type;
  final String service_version;
  final String aTitle;
  final String url;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var title = 'Nasa api';
    final ApiService apiService = ApiService();
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
                      /*image: NetworkImage(
                          'https://apod.nasa.gov/apod/image/2202/Chamaeleon_RobertEder.jpg'),*/ // Space image
                        image: NetworkImage(url),
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
                    /*FutureBuilder<Apod>(
                      future: apiService.getData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          //return Text(snapshot.data!.title);
                          return apiImage(snapshot.data!.copyright,
                                snapshot.data!.date,
                                snapshot.data!.explanation,
                                snapshot.data!.hdurl,
                                snapshot.data!.media_type,
                                snapshot.data!.service_version,
                                snapshot.data!.title,
                                snapshot.data!.url);
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),*/
                    Text(aTitle),
                    SizedBox(height: 20),
                    Text(copyright),
                    Text(date),
                    SizedBox(height: 20),
                    Text(explanation),
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
