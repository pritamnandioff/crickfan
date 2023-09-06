import 'package:crickfan/const.dart';
import 'package:crickfan/screens/match/contests_screen.dart';
import 'package:crickfan/screens/match/guide_screen.dart';
import 'package:crickfan/screens/match/my_contest_screen.dart';
import 'package:crickfan/screens/match/myteam_screen.dart';
import 'package:crickfan/screens/widgets/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:info_popup/info_popup.dart';

class MatchScreen extends StatefulWidget {
  final int index;
  const MatchScreen({super.key, required this.index});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Widget> tabs = const [
    Text(
      'Contests',
    ),
    Text("My Contests(0)"),
    Text("My Teams(0)"),
    Text("Guide"),
  ];
  List<Widget> screens = const [
    ContestsScreen(),
    Mycontests(),
    MyTeamScreen(),
    GuideScreen(),
  ];

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: kWhite,
        backgroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Match ${widget.index + 1}',
              style: const TextStyle(fontSize: 18),
            ),
            const Text(
              '6h 20m left',
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.info_outline),
          // ),
          const InfoWidget(icon: Icons.info_outline, info: "info info 1"),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notification_add_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.wallet_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: kPrimaryColor,
              labelColor: kPrimaryColor,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: const Color.fromARGB(255, 0, 0, 0),
              tabs: tabs,
            ),
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              controller: _tabController,
              children: screens,
            ),
          ),
        ],
      ),
    );
  }
}
