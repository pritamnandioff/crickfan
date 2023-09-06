import 'package:crickfan/const.dart';
import 'package:crickfan/screens/home/home_screen.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CurvedNavigationBarItem> btnNavBarItems = const [
    CurvedNavigationBarItem(
      child: Icon(
        Icons.home_outlined,
        color: Colors.white,
      ),
      label: 'Home',
      labelStyle: TextStyle(color: kWhite),
    ),
    CurvedNavigationBarItem(
      child: Icon(
        Icons.local_activity_outlined,
        color: Colors.white,
      ),
      label: 'Match',
      labelStyle: TextStyle(color: kWhite),
    ),
    CurvedNavigationBarItem(
      child: Icon(
        Icons.emoji_events_outlined,
        color: Colors.white,
      ),
      label: 'Rewards',
      labelStyle: TextStyle(color: kWhite),
    ),
    CurvedNavigationBarItem(
      child: Icon(
        Icons.chat_bubble_outline,
        color: Colors.white,
      ),
      label: 'Chat',
      labelStyle: TextStyle(color: kWhite),
    ),
    CurvedNavigationBarItem(
      child: Icon(
        Icons.workspace_premium_outlined,
        color: Colors.white,
      ),
      label: 'Winner',
      labelStyle: TextStyle(color: kWhite),
    ),
  ];
  List<Widget> screens = [
    const HomeScreen(),
    Container(),
    Container(),
    Container(),
    Container()
  ];
  int initailIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: kBlack,
        color: kPrimaryColor,
        items: btnNavBarItems,
        onTap: (index) {
          setState(() {
            initailIndex = index;
          });
        },
      ),
      body: screens[initailIndex],
    );
  }
}
