import 'package:flutter/material.dart';

class cardActores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 190,
      margin: const EdgeInsets.only(bottom: 30, top: 18),
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, int index) => _OnlyCardActore()),
    );
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
