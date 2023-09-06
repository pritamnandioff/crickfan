import 'package:crickfan/const.dart';
import 'package:flutter/material.dart';

class PlayerLayoutScreen extends StatefulWidget {
  const PlayerLayoutScreen({super.key});

  @override
  State<PlayerLayoutScreen> createState() => _PlayerLayoutScreenState();
}

class _PlayerLayoutScreenState extends State<PlayerLayoutScreen> {
  int teamA = 1;
  int teamB = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBlack.withOpacity(0.8),
        foregroundColor: kWhite,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("India vs NaPak"),
            Text(
              "10h 19s Left",
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
        actions: const [
          Icon(Icons.shield_outlined),
          SizedBox(
            width: kdefaulPadding / 2,
          ),
          Text("guru"),
          SizedBox(
            width: kdefaulPadding,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: kBlack.withOpacity(0.8),
                height: 100,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Divider(
                      indent: 10,
                      endIndent: 10,
                      color: kWhite,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: kdefaulPadding / 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: kdefaulPadding),
                          padding: const EdgeInsets.all(kdefaulPadding / 4),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kdefaulPadding / 2),
                              color: kWhite),
                          child: const Text(
                            "IND",
                            style: TextStyle(
                                color: kBlack, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Text(
                          "5 : 6",
                          style: TextStyle(color: kWhite, fontSize: 20),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: kdefaulPadding),
                          padding: const EdgeInsets.all(kdefaulPadding / 4),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kdefaulPadding / 2),
                              color: kBlack),
                          child: const Text(
                            "PAK",
                            style: TextStyle(
                                color: kWhite, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
          Expanded(
            flex: 9,
            child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: const Color.fromARGB(255, 6, 168, 90),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: const Color.fromARGB(255, 21, 135, 24),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: const Color.fromARGB(255, 6, 168, 90),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              color: const Color.fromARGB(255, 21, 135, 24),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: const Color.fromARGB(255, 240, 211, 115),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: const Color.fromARGB(255, 21, 135, 24),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: const Color.fromARGB(255, 6, 168, 90),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: const Color.fromARGB(255, 21, 135, 24),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: const Color.fromARGB(255, 6, 168, 90),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: kdefaulPadding * 2, horizontal: kdefaulPadding),
                  // margin: const EdgeInsets.only(
                  //     top: kdefaulPadding * 2,
                  //     left: kdefaulPadding,
                  //     right: kdefaulPadding,
                  //     bottom: kdefaulPadding * 5),
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kdefaulPadding * 7),
                    border: Border.all(color: kWhite),
                  ),
                ),
                Column(
                  children: [
                    const Text(
                      "Wicket keeper",
                      style: TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PlayerProfile(teamA: teamA),
                        PlayerProfile(teamA: teamB),
                      ],
                    ),
                    const Text(
                      "Batter",
                      style: TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PlayerProfile(teamA: teamA),
                        PlayerProfile(teamA: teamB),
                        PlayerProfile(teamA: teamB),
                      ],
                    ),
                    const Text(
                      "All-Rounder",
                      style: TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PlayerProfile(teamA: teamB),
                        PlayerProfile(teamA: teamA),
                        PlayerProfile(teamA: teamB),
                      ],
                    ),
                    const Text(
                      "Bowlers",
                      style: TextStyle(
                          color: kWhite,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PlayerProfile(teamA: teamB),
                        PlayerProfile(teamA: teamA),
                        PlayerProfile(teamA: teamA),
                      ],
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {},
                        child: const Text("Pick this team"))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar:
      //     TextButton(onPressed: () {}, child: Text("pick this Team")),
    );
  }
}

class PlayerProfile extends StatelessWidget {
  const PlayerProfile({
    super.key,
    required this.teamA,
  });

  final int teamA;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          width: 70,
          child: Image.asset(
            "assets/icons/player1.png",
            fit: BoxFit.fitHeight,
          ),
        ),
        Container(
          color: teamA == 1 ? kWhite : kBlack,
          padding: const EdgeInsets.symmetric(horizontal: kdefaulPadding / 2),
          child: Text(
            "MSD",
            style: TextStyle(
                color: teamA == 1 ? kBlack : kWhite,
                fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: kdefaulPadding / 3),
          child: Text(
            "8.3 Cr",
            style: TextStyle(color: kWhite, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
