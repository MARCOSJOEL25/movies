import 'package:flutter/material.dart';
import 'package:movies/models/models.dart';
import 'package:movies/widgets/widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Result movie = ModalRoute.of(context)!.settings.arguments as Result;

    return Scaffold(
        body: CustomScrollView(slivers: [
      _CustomApp(title: movie.title, posterBack: movie.backPosting),
      SliverList(
          delegate: SliverChildListDelegate([
        _TitleAndPoster(
          title: movie.title,
          poster: movie.fullpostimg,
          originalTitle: movie.originalTitle,
          voteAverage: movie.voteAverage,
        ),
        _Overview(
          description: movie.overview,
        ),
        _Overview(
          description: movie.overview,
        ),
        _Overview(
          description: movie.overview,
        ),
        _Overview(
          description: movie.overview,
        ),
        cardActores(movieid: movie.id),
      ]))
    ]));
  }
}

class _CustomApp extends StatelessWidget {
  final String title;
  final String posterBack;

  const _CustomApp({required this.title, required this.posterBack});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 20),
          color: Colors.black12,
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(posterBack),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _TitleAndPoster extends StatelessWidget {
  final String title;
  final String poster;
  final String originalTitle;
  final double voteAverage;

  const _TitleAndPoster(
      {required this.title,
      required this.poster,
      required this.originalTitle,
      required this.voteAverage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(poster),
              fit: BoxFit.cover,
              height: 150,
            ),
          ),
          const SizedBox(width: 20),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title,
                style: Theme.of(context).textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2),
            Text(originalTitle,
                style: Theme.of(context).textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2),
            Row(
              children: [
                const Icon(Icons.star_outline, size: 15, color: Colors.grey),
                const SizedBox(width: 5),
                Text('$voteAverage')
              ],
            )
          ])
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final String description;

  const _Overview({required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        description,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
