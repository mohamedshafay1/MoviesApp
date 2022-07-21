import 'package:flutter/material.dart';
class MoviesModel{
  int id;
  String original_title;
  String overview;
  String title;
  String release_date;
  String backdrop_path;
  String poster_path;
  num vote_average;

  MoviesModel({
    required this.id,
    required this.original_title,
    required this.overview,
    required this.title,
    required this.release_date,
    required this.backdrop_path,
    required this.poster_path,
    required this.vote_average,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'original_title': this.original_title,
      'overview': this.overview,
      'title': this.title,
      'release_date': this.release_date,
      'backdrop_path': this.backdrop_path,
      'poster_path': this.poster_path,
      'vote_average': this.vote_average,
    };
  }

  factory MoviesModel.fromMap(Map<String, dynamic> map) {
    return MoviesModel(
      id: map['id'] as int,
      original_title: map['original_title'] as String,
      overview: map['overview'] as String,
      title: map['title'] as String,
      release_date: map['release_date'] as String,
      backdrop_path: map['backdrop_path'] as String,
      poster_path: map['poster_path'] as String,
      vote_average: map['vote_average'] as num,
    );
  }
}