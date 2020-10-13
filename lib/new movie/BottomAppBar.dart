import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6,
      color: Colors.transparent,
      elevation: 9,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25)
          ),
          color: Colors.amber[700]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width/2-40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.home,color: Colors.black),
                  Icon(Icons.person_outline,color: Colors.black),
                ],
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width/2-40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.search,color: Colors.black),
                  Icon(Icons.shopping_basket,color: Colors.black),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
