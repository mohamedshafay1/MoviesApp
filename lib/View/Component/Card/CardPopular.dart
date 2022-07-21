import 'package:flutter/material.dart';
import 'package:netflix/Controller/Network/endpoint.dart';

import '../../../constant.dart';
class CardPopular extends StatelessWidget {
  String title;
  String poster_path;

  CardPopular({
    required this.title,
    required this.poster_path,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: primarycolor,
      child:Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Image.network("${image_url}${poster_path}",
              fit: BoxFit.cover,
              height: 100,

            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 2.0),
              child: Card(
                  color: black,
                  child:
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(5 ),
                child: Text(
                  "${title}",
                  textAlign: TextAlign.center,
                  style:TextStyle(color: Colors.white) ,
                ),
              )),
            )
          ],
        ),
      ) ,
    );
  }


}
