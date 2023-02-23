// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';

class CardSlider extends StatelessWidget {
  final String? title;
  final List<Result> movies;

  const CardSlider({super.key, this.title, required this.movies});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Populares',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (_, int index) =>
                      _movieSlider(movie: movies[index])))
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _movieSlider extends StatelessWidget {
  final Result movie;

  const _movieSlider({required this.movie});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 150,
        height: 400,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.fullpostimg),
                  fit: BoxFit.cover),
            ),
            Text(
              movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
