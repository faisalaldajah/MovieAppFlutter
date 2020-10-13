import 'package:flutter/material.dart';
import 'package:biz_card/MovieDataList.dart';
import 'MoviePageDetails.dart';

final List<MoviesDataList> moviesDataList = MoviesDataList.getMoviesDataList();

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: ListView(
        children: <Widget>[
          SizedBox(height: 5.0),
          Container(
              padding: EdgeInsets.all(5.0),
              width: MediaQuery.of(context).size.width - 20.0,
              height: MediaQuery.of(context).size.height - 100,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                padding: EdgeInsets.all(5),
                itemCount: moviesDataList.length,
                itemBuilder: (BuildContext context, int index) {
                  return MovieCard(index);
                },
              )),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final int index;

  MovieCard(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MoviePageDetails(moviesDataList[index],index),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.black54,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Icon(Icons.star, color: Colors.amber[700])],
                ),
              ),
              Hero(
                  tag: index,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage:
                        NetworkImage('${moviesDataList[index].poster}'),
                  )),
              Text(
                '${moviesDataList[index].title}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Muli',
                  fontSize: 15,
                ),
              ),
              Flexible(
                child: Text(
                  '${moviesDataList[index].genre}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Muli',
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
