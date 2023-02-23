// To parse this JSON data, do
//
//     final popularMovie = popularMovieFromJson(jsonString);

import 'dart:convert';

import 'movie.dart';


class PopularMovie {
  PopularMovie({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory PopularMovie.fromJson(String str) =>
      PopularMovie.fromMap(json.decode(str));

  factory PopularMovie.fromMap(Map<String, dynamic> json) => PopularMovie(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
