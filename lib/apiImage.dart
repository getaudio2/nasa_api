import 'package:flutter/material.dart';

class apiImage extends StatefulWidget {
  String copyright = "a";
  String date = "a";
  String explanation = "a";
  String hdurl = "a";
  String media_type = "a";
  String service_version = "a";
  String title = "a";
  String url = "a";

  apiImage(String copyright, 
            String date, 
            String explanation, 
            String hdurl, 
            String media_type, 
            String service_version,
            String title,
            String url) {
    this.copyright = copyright;
    this.date = date;
    this.explanation = explanation;
    this.hdurl = hdurl;
    this.media_type = media_type;
    this.service_version = service_version;
    this.title = title;
    this.url = url;
  }

  //const apiImage({ Key? key }) : super(key: key);

  @override
  _apiImageState createState() => _apiImageState(copyright,
                                                  date,
                                                  explanation,
                                                  hdurl,
                                                  media_type,
                                                  service_version,
                                                  title,
                                                  url);
}

class _apiImageState extends State<apiImage> {

  String copyright = "a";
  String date = "a";
  String explanation = "a";
  String hdurl = "a";
  String media_type = "a";
  String service_version = "a";
  String title = "a";
  String url = "a";
  
  _apiImageState(String copyright, 
            String date, 
            String explanation, 
            String hdurl, 
            String media_type, 
            String service_version,
            String title,
            String url) {
    this.copyright = copyright;
    this.date = date;
    this.explanation = explanation;
    this.hdurl = hdurl;
    this.media_type = media_type;
    this.service_version = service_version;
    this.title = title;
    this.url = url;
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}