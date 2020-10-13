import 'package:biz_card/Movie2/MovieAppDatabase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'MovieDataBase.dart';
import 'MovieDetailsDataBase.dart';

final List<MovieDataBase> moviesDataList = MovieDataBase.getMovieDataBase();

class MoviePageDataBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: ListView(
        children: [
          SizedBox(
            height: 12,
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            width: MediaQuery.of(context).size.width - 20.0,
            height: MediaQuery.of(context).size.height - 100,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: moviesDataList.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieCardDesign(index);
              },
            ),
          )
        ],
      ),
    );
  }
}

class MovieCardDesign extends StatelessWidget {
  final int index;
  MovieCardDesign(this.index);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsDataBase(
              index,
              movieDataBase[index],
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.star),
              ],
            ),
            Hero(
              tag: moviesDataList[index],
              child: CircleAvatar(
                backgroundImage: NetworkImage('${movieDataBase[index].poster}'),
                radius: 40,
              ),
            ),
            Text('${movieDataBase[index].title}'),
            Text('${movieDataBase[index].genre}'),
          ],
        ),
      ),
    );
  }
}
