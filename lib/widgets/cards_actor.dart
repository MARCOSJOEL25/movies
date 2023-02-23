import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:movies/models/Cast.dart';
// import 'package:movies/providers/movies_providers.dart';
// import 'package:provider/provider.dart';

// ignore: camel_case_types
class cardActores extends StatelessWidget {
  final int movieid;

  const cardActores({super.key, required this.movieid});

  @override
  Widget build(BuildContext context) {
    // final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    // FutureBuilder(
    //   future: moviesProvider.getCast(movieid),
    //   builder: (_, AsyncSnapshot<List<CastElement>> snapshot) {
    //     // if (!snapshot.hasData) {
    //     //   return Container(
    //     //     constraints: const BoxConstraints(maxWidth: 150),
    //     //     height: 190,
    //     //     child: const CupertinoActivityIndicator(),
    //     //   );
    //     // }

    //     // final List<CastElement>? cast = snapshot.data;

        return Container(
          width: double.infinity,
          height: 190,
          margin: const EdgeInsets.only(bottom: 30, top: 18),
          child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, int index) => _OnlyCardActore()),
        );
    //   },
    // );
  }
}

class _OnlyCardActore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 110,
        height: 100,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('http://via.placeholder.com/50x75'),
                fit: BoxFit.cover,
                width: 100,
                height: 110,
              ),
            ),
            const SizedBox(height: 20),
            const Text('actor.name dsadasdasda')
          ],
        ));
  }
}
