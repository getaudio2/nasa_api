import 'package:flutter/material.dart';
import 'package:nasa_api/apiService/ApiService.dart';
import 'package:nasa_api/model/apod.dart';
import 'package:nasa_api/apiImage.dart';

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