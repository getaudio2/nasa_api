import 'package:flutter/material.dart';
import 'package:nasa_api/apiService/ApiService.dart';
import 'package:nasa_api/model/apod.dart';
import 'package:nasa_api/screens/detail.dart';

class fetchData extends StatefulWidget {
  const fetchData({ Key? key }) : super(key: key);

  @override
  _fetchDataState createState() => _fetchDataState();
}

class _fetchDataState extends State<fetchData> {
  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();
    return MaterialApp(
      title: 'Fetch Data Example',
      home: Scaffold(
        body: Center(
          child: FutureBuilder<Apod>(
            future: apiService.getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //return Text(snapshot.data!.title);
                  return Detail(copyright: snapshot.data!.copyright,
                                date: snapshot.data!.date,
                                explanation: snapshot.data!.explanation,
                                hdurl: snapshot.data!.hdurl,
                                media_type: snapshot.data!.media_type,
                                service_version: snapshot.data!.service_version,
                                aTitle: snapshot.data!.title,
                                url: snapshot.data!.url);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }else{
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}