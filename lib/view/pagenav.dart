import 'package:damaanati_ft/view/page.dart';
import 'package:flutter/material.dart';

class Pagenav extends StatefulWidget {
  const Pagenav({super.key});

  @override
  _PagenavState createState() => _PagenavState();
}

class _PagenavState extends State<Pagenav> {

  
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    ItemsPage(items: [],),
    RemindersSetupPage(items: []),
    RemindersPage(reminders:[]),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Items',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add Reminder',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              label: 'Reminders',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      );
    

  }
}