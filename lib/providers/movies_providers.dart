import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apikey = '975fbc2fd7cf02a4c23fa3da3830db13';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Result> onDisplayMovies = [];
  List<Result> onDisplayMoviesPopular = [];
  int popularPage = 0;

  MoviesProvider() {
    print('moviesProvider inicializado');

    this.getOnDisplayMovies();
    this.getOnDisplayMoviesPopular();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language, 'page': '1'});

    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    //final Map<String, dynamic> decodedData = json.decode(response.body);
    //print(nowPlayingResponse.results[0].title);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getOnDisplayMoviesPopular() async {
    popularPage++;

    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apikey, 'language': _language, 'page': popularPage});

    final response = await http.get(url);
    final popularMovie = PopularMovie.fromJson(response.body);
    //final Map<String, dynamic> decodedData = json.decode(response.body);
    //print(nowPlayingResponse.results[0].title);

    onDisplayMoviesPopular = [
      ...onDisplayMoviesPopular,
      ...popularMovie.results
    ];

    notifyListeners();
  }
}
