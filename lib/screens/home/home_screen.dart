import 'package:flutter/material.dart';
import 'package:crickfan/screens/games/baseball/baseball_screen.dart';
import 'package:crickfan/screens/games/basketball/basketball_screen.dart';
import 'package:crickfan/screens/games/cricket/cricket_screen.dart';
import 'package:crickfan/screens/games/football/football_screen.dart';
import 'package:crickfan/screens/games/handball/handabll_screen.dart';
import 'package:crickfan/screens/games/hockey/hockey_screen.dart';
import 'package:crickfan/screens/games/vollyball/vollyball_screen.dart';
import 'package:flutter/rendering.dart';
import '../../const.dart';
import '../widgets/custom_drawer.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Widget> tabs = const [
    Tab(
      child: Column(
        children: [
          Icon(Icons.sports_cricket_outlined),
          Text('Cricket'),
        ],
      ),
    ),
    Tab(
      child: Column(
        children: [
          Icon(Icons.sports_soccer_outlined),
          Text('Football'),
        ],
      ),
    ),
    Tab(
      child: Column(
        children: [
          Icon(Icons.sports_basketball_outlined),
          Text('Basketball'),
        ],
      ),
    ),
    Tab(
      child: Column(
        children: [
          Icon(Icons.sports_baseball_outlined),
          Text('Baseball'),
        ],
      ),
    ),
    Tab(
      child: Column(
        children: [
          Icon(Icons.sports_hockey_outlined),
          Text('Hockey'),
        ],
      ),
    ),
    Tab(
      child: Column(
        children: [
          Icon(Icons.sports_hockey_outlined),
          Text('Handball'),
        ],
      ),
    ),
    Tab(
      child: Column(
        children: [
          Icon(Icons.sports_volleyball_outlined),
          Text('Vollyball'),
        ],
      ),
    ),
  ];
  List<Widget> screens = [
    CricketScreen(),
    const FootballScreen(),
    const BasketBallScreen(),
    const BaseballScreen(),
    const HockeyScreen(),
    const HandBallScreen(),
    const VollyballScreen(),
  ];
  bool _showAppbar = true;
  ScrollController _scrollBottomBarController = ScrollController();
  bool isScrollingDown = false;
  bool _show = true;
  double bottomBarHeight = 75;
  double _bottomBarOffset = 0;

  void showBottomBar() {
    setState(() {
      _show = true;
    });
  }

  void hideBottomBar() {
    setState(() {
      _show = false;
    });
  }

  void myScroll() async {
    _scrollBottomBarController.addListener(() {
      if (_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          hideBottomBar();
        }
      }
      if (_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          showBottomBar();
        }
      }
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    myScroll();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollBottomBarController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _showAppbar
          ? AppBar(
              foregroundColor: Colors.white,
              backgroundColor: kPrimaryColor,
              title: const Text(
                "Dashhboard",
              ),
              actions: [
                IconButton(
                  onPressed: () => showCustomDialog(context),
                  icon: const Icon(
                    Icons.account_balance_wallet_outlined,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: kdefaulPadding - 3),
                  child: badges.Badge(
                    badgeContent: Text(
                      '3',
                      style: TextStyle(color: kWhite),
                    ),
                    child: Icon(
                      Icons.notifications_none_outlined,
                    ),
                  ),
                )
              ],
              centerTitle: true,
              bottom: TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: kSecoundaryColor,
                labelColor: kSecoundaryColor,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: const Color.fromARGB(255, 223, 220, 220),
                tabs: tabs,
              ),
            )
          : PreferredSize(
              child: Container(),
              preferredSize: Size(0.0, 0.0),
            ),
      drawer: const CustomDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: screens,
      ),
    );
  }
}

void showCustomDialog(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 100,
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: kWhite,
                borderRadius:
                    BorderRadius.vertical(top: Radius.elliptical(150, 30)),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Column(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_double_arrow_down_outlined),
                    color: kWhite,
                    onPressed: () => Navigator.pop(context),
                  ),
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: kPrimaryColor,
                        blurRadius: 10.0,
                        spreadRadius: 5.0,
                        offset: Offset(0.0, 0.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  "Wallet Balance : 200$inr",
                  style: TextStyle(color: kBlack, fontSize: 20),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.wallet,
                    color: kBlack,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
