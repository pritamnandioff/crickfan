import 'package:crickfan/const.dart';
import 'package:crickfan/screens/creatematch/playerlayout_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlayerSelectScreen extends StatefulWidget {
  const PlayerSelectScreen({super.key});

  @override
  State<PlayerSelectScreen> createState() => _PlayerSelectScreenState();
}

class _PlayerSelectScreenState extends State<PlayerSelectScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  double totalCredit = 100;
  double creditLeft = 0;
  var teamA = [
    {
      "player_name": "A Singh",
      "imagePath": "assets/icons/player1.png",
      "credit_point": "20",
      "country": "ind",
      "playerType": "wicketKeeper"
    },
    {
      "player_name": "B Singh",
      "imagePath": "assets/icons/player1.png",
      "credit_point": "20",
      "country": "ind",
      "playerType": "Bowler"
    },
    {
      "player_name": "C Singh",
      "imagePath": "assets/icons/player1.png",
      "credit_point": "20",
      "country": "ind",
      "playerType": "allrounder"
    },
    {
      "player_name": "D Singh",
      "imagePath": "assets/icons/player1.png",
      "credit_point": "20",
      "country": "ind",
      "playerType": "allrounder"
    },
    {
      "player_name": "E Singh",
      "imagePath": "assets/icons/player1.png",
      "credit_point": "20",
      "country": "ind",
      "playerType": "allrounder"
    },
    {
      "player_name": "F Singh",
      "imagePath": "assets/icons/player1.png",
      "credit_point": "20",
      "country": "ind",
      "playerType": "Batsman"
    },
    {
      "player_name": "G Singh",
      "imagePath": "assets/icons/player1.png",
      "credit_point": "20",
      "country": "ind",
      "playerType": "Batsman"
    },
    {
      "player_name": "H Singh",
      "imagePath": "assets/icons/player1.png",
      "credit_point": "20",
      "country": "ind",
      "playerType": "Batsman"
    },
    {
      "player_name": "I Singh",
      "imagePath": "assets/icons/player1.png",
      "credit_point": "20",
      "country": "ind",
      "playerType": "Batsman"
    },
    {
      "player_name": "J Singh",
      "imagePath": "assets/icons/player1.png",
      "credit_point": "20",
      "country": "ind",
      "playerType": "Bowler"
    },
    {
      "player_name": "K Singh",
      "imagePath": "assets/icons/player1.png",
      "credit_point": "20",
      "country": "ind",
      "playerType": "Bowler"
    }
  ];
  var teamB = [
    {
      "player_name": "1 Jadav",
      "imagePath": "assets/icons/player1.png",
      "credit_point": "20",
      "country": "pak",
      "playerType": "wicketKeeper"
    },
    {
      "player_name": "2 Jadav",
      "imagePath": "assets/icons/player1.png",
      "credit_point": "20",
      "country": "pak",
      "playerType": "Bowler"
    },
    {
      "player_name": "3 Jadav",
      "imagePath": "assets/icons/player1.png",
      "credit_point": "20",
      "country": "pak",
      "playerType": "allrounder"
    },
    {
      "player_name": "4 Jadav",
      "imagePath": "assets/icons/player1.png",
      "credit_point": "20",
      "country": "pak",
      "playerType": "allrounder"
    },
    {
      "player_name": "5 Jadav",
      "imagePath": "assets/icons/player1.png",
      "credit_point": "20",
      "country": "pak",
      "playerType": "allrounder"
    },
    {
      "player_name": "6 Jadav",
      "imagePath": "assets/icons/player1.png",
      "credit_point": "20",
      "country": "pak",
      "playerType": "Batsman"
    },
    {
      "player_name": "7 Jadav",
      "imagePath": "assets/icons/player1.png",
      "credit_point": "20",
      "country": "pak",
      "playerType": "Batsman"
    },
    {
      "player_name": "8 Jadav",
      "imagePath": "assets/icons/player1.png",
      "credit_point": "20",
      "country": "pak",
      "playerType": "Batsman"
    },
    {
      "player_name": "9 Jadav",
      "imagePath": "assets/icons/player1.png",
      "credit_point": "20",
      "country": "pak",
      "playerType": "Batsman"
    },
    {
      "player_name": "10 Jadav",
      "imagePath": "assets/icons/player1.png",
      "credit_point": "20",
      "country": "pak",
      "playerType": "Bowler"
    },
    {
      "player_name": "11 Jadav",
      "imagePath": "assets/icons/player1.png",
      "credit_point": "20",
      "country": "pak",
      "playerType": "Bowler"
    }
  ];
  List wicketKipper = [];
  List allrounder = [];
  List batsman = [];
  List bowler = [];
  List myPlayers = [];

  List<Tab> tabs = const [
    Tab(
      child: Text("WK"),
    ),
    Tab(
      child: Text("BAT"),
    ),
    Tab(
      child: Text("AR"),
    ),
    Tab(
      child: Text("Bowl"),
    ),
  ];
  getWicketkeeper() {
    for (int i = 0; i < teamA.length; i++) {
      if (teamA[i]["playerType"] == 'wicketKeeper') {
        wicketKipper.add(teamA[i]);
      }
    }
    for (int i = 0; i < teamB.length; i++) {
      if (teamB[i]["playerType"] == 'wicketKeeper') {
        wicketKipper.add(teamB[i]);
      }
    }
  }

  getAllRounder() {
    for (int i = 0; i < teamA.length; i++) {
      if (teamA[i]["playerType"] == 'allrounder') {
        allrounder.add(teamA[i]);
      }
    }
    for (int i = 0; i < teamB.length; i++) {
      if (teamB[i]["playerType"] == 'allrounder') {
        allrounder.add(teamB[i]);
      }
    }
  }

  getBatsman() {
    for (int i = 0; i < teamA.length; i++) {
      if (teamA[i]["playerType"] == 'Batsman') {
        batsman.add(teamA[i]);
      }
    }
    for (int i = 0; i < teamB.length; i++) {
      if (teamB[i]["playerType"] == 'Batsman') {
        batsman.add(teamB[i]);
      }
    }
  }

  getBowler() {
    for (int i = 0; i < teamA.length; i++) {
      if (teamA[i]["playerType"] == 'Batsman') {
        bowler.add(teamA[i]);
      }
    }
    for (int i = 0; i < teamB.length; i++) {
      if (teamB[i]["playerType"] == 'Batsman') {
        bowler.add(teamB[i]);
      }
    }
  }

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    getWicketkeeper();
    getAllRounder();
    getBatsman();
    getBowler();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBlack.withOpacity(0.8),
        foregroundColor: kWhite,
        title: const Column(
          children: [Text("Create team 1")],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.question_answer))
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 130,
            color: kBlack.withOpacity(0.8),
          ),
          SizedBox(
            height: 30,
            child: TabBar(
              tabs: tabs,
              controller: _tabController,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                //wicketkeeper
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: wicketKipper.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: SizedBox(
                            child:
                                Image.asset(wicketKipper[index]["imagePath"])),
                        title: Text(wicketKipper[index]["player_name"]),
                        trailing: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            myPlayers.add(wicketKipper[index]);
                            setState(() {
                              creditLeft = totalCredit -
                                  int.parse(
                                      wicketKipper[index]["credit_point"]);
                            });

                            print(myPlayers);
                          },
                        ),
                      );
                    }),
                //Batsman
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: wicketKipper.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: SizedBox(
                            child: Image.asset(batsman[index]["imagePath"])),
                        title: Text(batsman[index]["player_name"]),
                        trailing: IconButton(
                          icon:const  Icon(Icons.add),
                          onPressed: () {
                            myPlayers.add(batsman[index]);
                            setState(() {
                              creditLeft = totalCredit -
                                  int.parse(batsman[index]["credit_point"]);
                            });

                            print(myPlayers);
                          },
                        ),
                      );
                    }),
                //All-rounder
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: allrounder.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: SizedBox(
                            child: Image.asset(allrounder[index]["imagePath"])),
                        title: Text(allrounder[index]["player_name"]),
                        trailing: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            myPlayers.add(allrounder[index]);
                            setState(() {
                              creditLeft = totalCredit -
                                  int.parse(allrounder[index]["credit_point"]);
                            });

                            print(myPlayers);
                          },
                        ),
                      );
                    }),
                //Bowler
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: bowler.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: SizedBox(
                            child: Image.asset(bowler[index]["imagePath"])),
                        title: Text(bowler[index]["player_name"]),
                        trailing: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            myPlayers.add(bowler[index]);
                            setState(() {
                              creditLeft = totalCredit -
                                  int.parse(bowler[index]["credit_point"]);
                            });
                            if (kDebugMode) {
                              print(myPlayers);
                            }
                          },
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kdefaulPadding),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => PlayerLayoutScreen())),
            child: Text("Preview")),
      ),
    );
  }
}
