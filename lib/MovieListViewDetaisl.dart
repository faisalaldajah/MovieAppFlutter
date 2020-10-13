import 'package:flutter/material.dart';
import 'MovieDataList.dart';

class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final String moviePoster;
  final MoviesDataList moviesDataList;
  MovieListViewDetails({this.movieName, this.moviePoster, this.moviesDataList});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(moviesDataList.poster),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Center(
                      child: Icon(
                    Icons.play_circle_outline,
                    size: 100,
                  )),
                ],
              ),
              SizedBox(height: 20,),
              Center(
                  child: Text(moviesDataList.title,
                      style: TextStyle(fontSize: 40,color: Color(0xffCFB53B)))),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(child: Text('${moviesDataList.genre}')),
                    Center(child: MovieDataText(field: 'Genre',moviesDataList: moviesDataList.genre,)),
                    MovieDataText(field: 'Plot',moviesDataList: moviesDataList.plot,),
                    MovieDataText(field: 'Director',moviesDataList: moviesDataList.director,),
                    MovieDataText(field: 'Writer',moviesDataList: moviesDataList.writer,),
                    MovieDataText(field: 'Ators',moviesDataList: moviesDataList.actors,),
                    Row(
                      children: [
                        MovieDataText(field: 'run time',moviesDataList: moviesDataList.runTime,),
                        MovieDataText(field: 'Year',moviesDataList: moviesDataList.year,),
                        
                      ],
                    )
                  ],
                ),),
            ],
          ),
        ),
      ),
    );
  }


  
}

class MovieDataText extends StatelessWidget {
  final String field;
  final String moviesDataList;
  MovieDataText ({this.field,this.moviesDataList});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15,right: 15,top: 10),
      child: Text('$field: $moviesDataList',style: TextStyle(fontSize: 15),),
    );
  }
}
