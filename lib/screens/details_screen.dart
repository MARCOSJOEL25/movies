import 'package:flutter/material.dart';
import 'package:movies/widgets/widget.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
        body: CustomScrollView(slivers: [
      _CustomApp(),
      SliverList(delegate: SliverChildListDelegate([
        _TitleAndPoster(),
        _Overview(),
        _Overview(),
        _Overview(),
        _Overview(),
        _Overview(),
        _Overview(),
        _Overview(),
        _Overview(),
        cardActores(),
        ]))
    ]));
  }
}

class _CustomApp extends StatelessWidget {
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
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('http://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _TitleAndPoster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('http://via.placeholder.com/50x75'),
              fit: BoxFit.cover,
              height: 150,
            ),
          ),
          const SizedBox(width: 20),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('movie.title',
                style: Theme.of(context).textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2),
            Text('movie.OriginalTitle',
                style: Theme.of(context).textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 2),
            Row(
              children: const [
                Icon(Icons.star_outline, size: 15, color: Colors.grey),
                SizedBox(width: 5),
                Text('movie.VoteAverage')
              ],
            )
          ])
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Text(
          'jdsflkjklfnklnskdlfhieuwfklsahdopjoajdojlaknfhnvnkomopjhropnc kljsdlkj oijoqiwdjp jsijdoaj podjspoajd jiqwuedn klsdsahk djksahdahs idhashdwqopjdop hqwdhpsa', textAlign: TextAlign.justify,),
    );
  }
}
