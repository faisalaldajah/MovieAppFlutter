import 'package:flutter/material.dart';
import 'CategoriesTabs.dart';
import 'BottomAppBar.dart';
import 'MoviePage.dart';

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Imdb',
          style: TextStyle(
              fontFamily: 'muli-bold', fontSize: 25, color: Colors.amber[700]),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: PageDesign(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.amber[700],
        child: Icon(
          Icons.add_shopping_cart_outlined,
          color: Colors.white,
        ),
        splashColor: Colors.orangeAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(),
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
      decoration: BoxDecoration(color: Colors.black38),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Text(
              'Categories',
              style: TextStyle(fontSize: 40, fontFamily: 'Muli'),
            ),
            CategoriesTabs(tabController: _tabController),
            Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: double.infinity - 20,
              child: TabBarView(
                controller: _tabController,
                children: [
                  MoviePage(),
                  MoviePage(),
                  MoviePage(),
                  MoviePage(),
                  MoviePage(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
