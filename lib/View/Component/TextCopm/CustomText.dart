import 'package:flutter/material.dart';
class CustomTest extends StatelessWidget {

  String? title ="" ;
  var ColorText;
  double? FontSize=12;
  var fontWeight = FontWeight.bold;

  CustomTest({
    this.title,
    required this.ColorText,
    this.FontSize,
    required this.fontWeight,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "$title",
        style:TextStyle(
            color:ColorText,
            fontSize: FontSize,
            fontWeight: fontWeight

        ) ,
      ),
    );
  }
}
