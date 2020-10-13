import 'package:flutter/material.dart';
import 'MovieDataBase.dart';
import 'package:biz_card/new movie/MoviePage.dart';
import 'MoviePageDataBese.dart';

final List<MovieDataBase> movieDataBase = MovieDataBase.getMovieDataBase();

class MovieAppDataBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Imdb',
          style: TextStyle(
            fontSize: 25,
            color: Colors.amber[700],
            fontFamily: 'Muli',
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.sort,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_basket_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: PageDesign(),
    );
  }
}

class PageDesign extends StatefulWidget {
  @override
  _PageDesignState createState() => _PageDesignState();
}

class _PageDesignState extends State<PageDesign>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: ListView(
        children: [
          Text(
            'Categories',
            style: TextStyle(fontSize: 40, fontFamily: 'Muli'),
          ),
          CategoriesDatabase(_tabController),
          Container(
            height: MediaQuery.of(context).size.height - 50.0,
            width: double.infinity - 20,
            child: TabBarView(
              controller: _tabController,
              children: [
                MoviePageDataBase(),
                MoviePage(),
                MoviePage(),
                MoviePage(),
                MoviePage(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CategoriesDatabase extends StatelessWidget {
  CategoriesDatabase(this._tabController);
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      indicatorColor: Colors.transparent,
      isScrollable: true,
      labelPadding: EdgeInsets.only(right: 30),
      labelColor: Colors.white,
      unselectedLabelColor: Colors.grey[400],
      tabs: [
        Tab(
          child: Text('TimeLine',
              style: TextStyle(fontSize: 20, fontFamily: 'Muli')),
        ),
        Tab(
          child: Text('Movies',
              style: TextStyle(fontSize: 20, fontFamily: 'Muli')),
        ),
        Tab(
          child:
              Text('News', style: TextStyle(fontSize: 20, fontFamily: 'Muli')),
        ),
        Tab(
          child: Text('Box office',
              style: TextStyle(fontSize: 20, fontFamily: 'Muli')),
        ),
        Tab(
          child: Text('Celebrity',
              style: TextStyle(fontSize: 20, fontFamily: 'Muli')),
        ),
      ],
    );
  }
}
