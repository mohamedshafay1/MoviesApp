import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:netflix/Controller/Network/endpoint.dart';
import 'package:netflix/Model/MoviesModel.dart';
import 'package:http/http.dart'as http;


class GetPopuler with ChangeNotifier{

  List<MoviesModel>MovieList=[];
  bool loading=true;
  bool error = true;

  GetPopuler() {
    GetMoviePopuler().then((value){
      notifyListeners();
    });
  }

   GetMoviePopuler() async{
    MovieList.clear();
    MovieList=[];
    try{
      var url=Uri.parse("${BASE_URL}${GET_POPULAR}${API_QUERY}");
      print(url);
      final response=await http.get(url);
      var responsebody=jsonDecode(response.body)["results"];
      print(responsebody);

      for(var i in responsebody){
        MovieList.add(MoviesModel.fromMap(i));
      }
      // for(int i=0;i<responsebody;i++){
      //   MovieList.add(MoviesModel.fromMap(responsebody[i]));
      // }
      loading=false;
      error=false;
    }catch(Error){
      print(Error);
      loading=false;
      error=true;
    }
   }
}