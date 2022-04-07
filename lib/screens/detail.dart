import 'package:flutter/material.dart';
import 'package:nasa_api/fetchData.dart';
import 'package:nasa_api/screens/login.dart';
import 'package:nasa_api/apiService/ApiService.dart';
import 'package:nasa_api/model/apod.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

getId() async {
    final prefs = await SharedPreferences.getInstance();
    final String? id = prefs.getString('id');
    return id.toString();
  }

  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery. of(context). size. width ;
    double sHeight = MediaQuery. of(context). size. height;
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
              width: sWidth,
              height: size.height * 0.5,
              decoration: BoxDecoration(
                  image: new DecorationImage(
                        image: NetworkImage(url),
                      fit: BoxFit.cover)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 275),
              width: sWidth,
              height: (size.height * 0.5) + 275,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            aTitle,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite),
                          onPressed: () async {
                              print("Fav button pressed");
                              String userId = await getId();
                              print("UserId: " + userId);

                            apiService
                                .addFav(userId, date, explanation, aTitle,
                                    url, copyright)
                                .then((result) {
                              print("ADDFAV RETURNS: " + result.toString());
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.download),
                          onPressed: () async {
                            final response = await http.get(Uri.parse(url));

                            // Get the image name
                            final imageName = path.basename(url);
                            // Get the document directory path
                            final appDir = await path_provider
                                .getApplicationDocumentsDirectory();

                            // This is the saved image path
                            // You can use it to display the saved image later
                            final localPath = path.join(appDir.path, imageName);
                            print(localPath + " <- esta es la ruta");

                            // Downloading
                            final imageFile = File(localPath);
                            await imageFile.writeAsBytes(response.bodyBytes);

                            
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.share),
                          onPressed: () async {
                            final uri = Uri.parse(url);
                            final response = await http.get(uri);
                            final bytes = response.bodyBytes;

                            Directory temp = await path_provider.getTemporaryDirectory();
                            final path = '${temp.path}/image.jpg';
                            File(path).writeAsBytesSync(bytes);

                            await Share.shareFiles([path],
                                text: aTitle + "\n" + date + "\n" + url);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        copyright,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(date),
                    ),
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



