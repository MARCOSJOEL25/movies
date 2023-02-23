import 'package:flutter/material.dart';
import 'package:movies/providers/movies_providers.dart';
import 'package:movies/widgets/widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper( movies: moviesProvider.onDisplayMovies ),
            CardSlider(movies: moviesProvider.onDisplayMoviesPopular,
                      title: 'populares'),
          ],
        ),
      ),
    );
  }
}
