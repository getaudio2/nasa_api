import 'package:flutter/material.dart';
import 'package:nasa_api/apiService/ApiService.dart';
import 'package:nasa_api/model/apod.dart';
import 'package:nasa_api/screens/llistat.dart';

class fetchList extends StatefulWidget {
  const fetchList({ Key? key }) : super(key: key);

  @override
  State<fetchList> createState() => _fetchListState();
}

class _fetchListState extends State<fetchList> {
  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();
    return MaterialApp(
      title: 'Fetch Data Example',
      home: Scaffold(
        body: Center(
          child: FutureBuilder<List<Apod>>(
            future: apiService.fetchApods(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Llistat(apodList: snapshot.data!);
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