import 'package:flutter/material.dart';

class CategoriesTabs extends StatelessWidget {
  const CategoriesTabs({
    Key key,
    @required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

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
