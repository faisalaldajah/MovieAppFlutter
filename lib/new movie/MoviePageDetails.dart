import 'package:flutter/material.dart';
import 'package:biz_card/MovieDataList.dart';

class MoviePageDetails extends StatelessWidget {
  final MoviesDataList movieDataList;
  final int index;
  MoviePageDetails(this.movieDataList, this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: index,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(movieDataList.poster),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.08, 0.5],
                    colors: [
                      Colors.black87,
                      Color(0x06000000),
                    ],
                  ),
                ),
                child: Icon(
                  Icons.play_circle_outline,
                  size: 80,
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    Text(
                      '${movieDataList.title}',
                      style: TextStyle(
                        fontFamily: 'Muli',
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('${movieDataList.genre}')
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
