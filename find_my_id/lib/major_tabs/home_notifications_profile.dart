import 'package:find_my_id/constants/string_resources.dart';
import 'package:find_my_id/decor/palette.dart';
import 'package:find_my_id/major_tabs/home_page.dart';
import 'package:find_my_id/major_tabs/notifications_page.dart';
import 'package:find_my_id/major_tabs/profile_page.dart';
import 'package:flutter/material.dart';

class HomeNotificationsProfile extends StatefulWidget {
  const HomeNotificationsProfile({Key? key}) : super(key: key);

  @override
  State<HomeNotificationsProfile> createState() =>
      _HomeNotificationsProfileState();
}

class _HomeNotificationsProfileState extends State<HomeNotificationsProfile> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _navigate(value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        HomePage(),
        NotificationsPage(),
        ProfilePage(),
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorWhiteBackground,
        selectedItemColor: colorNavIconChecked,
        unselectedItemColor: colorNavIconUnchecked,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: homeNavLabel,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_rounded),
            label: alertsNavLabel,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: profileNavLabel,
          ),
        ],
        elevation: 20,
        currentIndex: _selectedIndex,
        onTap: (value) => {_navigate(value)},
      ),
    );
  }
}
