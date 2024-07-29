import 'package:courses/screens/feed.dart';
import 'package:courses/screens/home_screen.dart';
import 'package:courses/screens/mycourse.dart';
import 'package:courses/screens/notification.dart';

import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    MyCoursePage(),
    Feed(),
    Noti(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        leading: Icon(Icons.menu_outlined),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications, color: Colors.blueAccent),
          )
        ],
        backgroundColor: Colors.lightBlue.shade50,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'My Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.rss_feed), label: 'Feed'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(color: Colors.blue[800]),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        onTap: _onItemTapped,
      ),
    );
  }
}
