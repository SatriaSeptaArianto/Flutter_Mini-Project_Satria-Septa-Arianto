import 'package:covid_app/screens/care_screen.dart';
import 'package:covid_app/screens/info/info_screen.dart';
import 'package:covid_app/screens/facility/facility_screen.dart';
import 'package:covid_app/screens/user_screen.dart';
import 'package:covid_app/utils/constant.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const InfoScreen(),
    CareScreen(),
    const LocationScreen(),
    const UserScreen()
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
            icon: Icon(Icons.analytics),
            label: 'Data',
            backgroundColor: kBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Health Info',
            backgroundColor: kBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Vaccine Facility',
            backgroundColor: kBackgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
            backgroundColor: kBackgroundColor,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}