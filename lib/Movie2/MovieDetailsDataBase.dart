import 'package:flutter/material.dart';
import 'MovieDataBase.dart';

class MovieDetailsDataBase extends StatelessWidget {
  final MovieDataBase movieDataBase;
  final int index;
  MovieDetailsDataBase(this.index, this.movieDataBase);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: index,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('${movieDataBase.poster}'),
            ),
          ),
        ),
      ),
    );
  }
}
