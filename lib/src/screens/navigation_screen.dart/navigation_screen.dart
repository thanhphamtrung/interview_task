import 'package:flutter/material.dart';

import '../home_screen/home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    const TextStyle optionStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    const List<Widget> _widgetOptions = <Widget>[
      HomeScreen(),
      Center(
        child: Text(
          'Page 2: Search',
          style: optionStyle,
        ),
      ),
      Center(
        child: Text(
          'Page 3: Plus',
          style: optionStyle,
        ),
      ),
      Center(
        child: Text(
          'Page 4: Comment',
          style: optionStyle,
        ),
      ),
      Center(
        child: Text(
          'Page 5: Profile',
          style: optionStyle,
        ),
      ),
    ];

    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home.png',
              width: 70,
              height: 40,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/search.png',
              width: 70,
              height: 40,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/new.png',
                width: 70,
                height: 40,
              ),
              label: 'Plus'),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/comment.png',
              width: 70,
              height: 40,
            ),
            label: 'Comment',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/person.png',
              width: 70,
              height: 40,
            ),
            label: 'Person',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
