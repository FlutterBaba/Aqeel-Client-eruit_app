import 'package:eruit_app/const.dart';
import 'package:eruit_app/pages/calendar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'more_menu_page.dart';
import 'order_list.dart';
import 'user_profile.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const CalendarPage(),
    // CalendarPage(),

    const OrderListPage(),
    const UserProfile(),
    const MoreMenuPage(),

    // UserProfile(),
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
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: ktextColor,
        elevation: 0,
        backgroundColor: const Color(0xffF9FAFB),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
              color: _selectedIndex == 0 ? kpColor : ktextColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/shopping-cart.svg",
              color: _selectedIndex == 1 ? kpColor : ktextColor,
            ),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/user.svg",
              color: _selectedIndex == 2 ? kpColor : ktextColor,
            ),
            label: 'My Profile',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/more-vertical.svg",
              color: _selectedIndex == 3 ? kpColor : ktextColor,
            ),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kpColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
