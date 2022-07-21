import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Controller/Network/endpoint.dart';
import 'dart:io'as io;
import 'dart:ui'as ui;
import 'dart:math'as math;

import 'package:netflix/Model/MoviesModel.dart';
class DetailsScreen extends StatefulWidget {
  MoviesModel moviesmodel;
  DetailsScreen(this.moviesmodel);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: Image.network(
              "${image_url}${widget.moviesmodel.poster_path}",
              fit: BoxFit.fill,
            ),
          ),
          BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.1),
            ),
          
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start ,
                children: [
                  SizedBox(height: 10,),
                  TextButton.icon(onPressed: (){
                    Navigator.of(context).pop();
                  },
                      icon:Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 25,
                      ),
                       label:Text (
                         "Back",
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 25,
                           fontWeight: FontWeight.bold
                         ),
                       )),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: FlipCard(
                  fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
                  direction: FlipDirection.HORIZONTAL, // default
                  front: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage("${image_url}${widget.moviesmodel.poster_path}"),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  back: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage("${image_url}${widget.moviesmodel.backdrop_path}"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
              ),
                  SizedBox(
                      height:MediaQuery.of(context).size.height/5
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 70,
                        child: Text(
                          "${widget.moviesmodel.title}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 30,
                          child:Text(
                            "${widget.moviesmodel.vote_average}/10",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                      height:MediaQuery.of(context).size.height/50,

                  ),
                  Text(
                      "${widget.moviesmodel.overview}",
                    style: TextStyle(
                      color: Colors.white,),)
                ],
              ),
            ),
          )


        ],
      ),
    );
  }
}
