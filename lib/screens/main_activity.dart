import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shop_app/Gobal/Gobal.dart';
import 'package:shop_app/Model/constants.dart';
import 'package:shop_app/API/GetAPI.dart';
import 'package:shop_app/screens/Acount/acount_login_acitivty.dart';
import 'package:shop_app/screens/Search/Search_Activity.dart';
import 'package:shop_app/screens/home/components/HomeActivity.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/menu/menu_acitivity.dart';
import 'package:shop_app/screens/Notification/notification_activity.dart';

import 'Acount/acount_activity.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreen();
  PageController pageController;
}

class _HomeScreen extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> _screen = [
    HomeActivity(),
    MenuActivity(),
    SearchActivity(),
    Notification_Screen(),
    goBal.CheckLogin == 1 ? AcountActivity() : AcountLoginActivity()
  ];
  void changeSearch(int index) {
    setState(() {

    });
  }
  ///
  @override
  void initState() {
    super.initState();
    widget.pageController = PageController(initialPage: _selectedIndex);
  }

  ///
  @override
  void dispose() {
    widget.pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView(
          children: _screen,
          controller: widget.pageController,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Trang Chủ',
            backgroundColor: mautrang,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Danh Mục',
            backgroundColor: mautrang,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Tìm Kiếm ',
            backgroundColor: mautrang,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            label: 'Thông Báo ',
            backgroundColor: mautrang,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Cá Nhân',
            backgroundColor: mautrang,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: maucam,
        unselectedItemColor: kTextColor,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      widget.pageController.jumpToPage(index);
    });
  }
}
