import 'package:flutter/material.dart';
import 'package:nasa_api/model/apod.dart';

class Llistat extends StatelessWidget {
  const Llistat({ Key? key, required this.apodList }) : super(key: key);

  final List<Apod> apodList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: apodList.length,
      itemBuilder: (context, index) {
        return Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              debugPrint('Card tapped.');
            },
            /*child: const SizedBox(
              width: 300,
              height: 100,
              child: Text('A card that can be tapped'),
            ),*/
            child: ListTile(
              leading: Image.network(apodList[index].url),
              title: Text(apodList[index].title),
              subtitle: Text('Copyright: ' + apodList[index].copyright),
            ),
          ),
        );
        //return Image.network(apodList[index].url);
      },
    );
  }
}