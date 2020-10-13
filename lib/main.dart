import 'package:flutter/material.dart';
import 'MovieDataList.dart';
import 'MovieListViewDetaisl.dart';
import 'package:biz_card/new movie/Movie_app.dart';
import 'Movie2/MovieAppDatabase.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MovieAppDataBase(),
    ),
  );
}

var ktextcolor = TextStyle(
  color: Colors.white,
);

class MyApp extends StatelessWidget {
  final List movies = [
    "Titanic",
    "BLade Runner",
    "Blade",
    "Matrix",
    "Lord of the Rings",
    "Avatar",
    "Rambo",
    "300",
  ];

  final List<MoviesDataList> movieList = MoviesDataList.getMoviesDataList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              movieCard(movieList[index], context),
            ],
          );
        },
      ),
    );
  }

  Widget movieCard(MoviesDataList moviesDataList, BuildContext context) {
    return InkWell(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Card(
          color: Colors.black45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              movieImage(moviesDataList.poster),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(moviesDataList.title),
                      ),
                      Text('Rating: ${moviesDataList.imdbRating}/10 ')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Released: ${moviesDataList.released}'),
                      Text(moviesDataList.runTime),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieListViewDetails(
              movieName: moviesDataList.title.toString(),
              moviePoster: moviesDataList.poster,
              moviesDataList: moviesDataList,
            ),
          ),
        );
      },
    );
  }

  Widget movieImage(String imageURL) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageURL),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
