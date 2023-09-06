import 'package:crickfan/const.dart';
import 'package:crickfan/screens/creatematch/player_select_screen.dart';
import 'package:crickfan/screens/verify/verify_screen.dart';
import 'package:flutter/material.dart';

class ContestsScreen extends StatefulWidget {
  const ContestsScreen({super.key});

  @override
  State<ContestsScreen> createState() => _ContestsScreenState();
}

class _ContestsScreenState extends State<ContestsScreen>
    with TickerProviderStateMixin {
  List<String> fuilter = ["Entry", "sports", "Prize Pool", "%winner"];
  var gameData = [
    {
      "name": "Prize Pool",
      "entry": "25",
      "prizePool": "5 Lakhs",
      "discounted_entry": "2",
      "spots": "20045",
      "spots_left": "10000",
      "winners_prize": "36987",
      "win_ratio": "40",
      "upto": "10",
      "garanteed": "y"
    },
    {
      "name": "Prize Pool",
      "entry": "105",
      "prizePool": "46 Lakhs",
      "discounted_entry": "50",
      "spots": "20045",
      "spots_left": "10000",
      "winners_prize": "36987",
      "win_ratio": "30",
      "upto": "10",
      "garanteed": "N"
    },
    {
      "name": "Prize Pool",
      "entry": "400",
      "prizePool": "50 Lakhs",
      "discounted_entry": "300",
      "spots": "20045",
      "spots_left": "10000",
      "winners_prize": "36987",
      "win_ratio": "20",
      "upto": "18",
      "garanteed": "N"
    },
    {
      "name": "Prize Pool",
      "entry": "505",
      "prizePool": "1 Corore",
      "discounted_entry": "800",
      "spots": "2305",
      "spots_left": "800",
      "winners_prize": "205",
      "win_ratio": "50",
      "upto": "12",
      "garanteed": "N"
    },
  ];
  int selectedindex = 0;
  // late AnimationController controller;
  // bool determinate = false;
  // @override
  // void initState() {
  //   controller = AnimationController(
  //     /// [AnimationController]s can be created with `vsync: this` because of
  //     /// [TickerProviderStateMixin].
  //     vsync: this,
  //     duration: const Duration(seconds: 2),
  //   )..addListener(() {
  //       setState(() {});
  //     });
  //   controller.repeat();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 20,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Stack(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: fuilter.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, i) {
                      return GestureDetector(
                        onTap: () => setState(() {
                          selectedindex = i;
                        }),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kdefaulPadding / 2,
                              vertical: kdefaulPadding / 2),
                          child: Row(
                            children: [
                              Text(
                                fuilter[i],
                                style: TextStyle(
                                    color: selectedindex == i
                                        ? Colors.black
                                        : Colors.grey),
                              ),
                              selectedindex == i
                                  ? const Icon(Icons.arrow_upward)
                                  : const SizedBox()
                            ],
                          ),
                        ),
                      );
                    }),
                Positioned(
                  right: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 20,
                    width: 30,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: const Icon(Icons.filter_alt_outlined),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: gameData.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (_, i) {
                return ListItems(
                  gameData: gameData,
                  i: i,
                );
              }),
        ],
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({super.key, required this.gameData, required this.i});

  final List<Map<String, String>> gameData;
  final int i;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PlayerSelectScreen(),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: kdefaulPadding / 2, vertical: kdefaulPadding / 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kdefaulPadding),
          border: Border.all(
            color: Colors.grey,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        height: 172,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: kdefaulPadding,
                  left: kdefaulPadding,
                  right: kdefaulPadding),
              height: 120,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kdefaulPadding),
                    topRight: Radius.circular(kdefaulPadding),
                  ),
                  color: Colors.white),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(gameData[i]["name"]!),
                      Text(
                        "Entry: ₹${gameData[i]["entry"]!}",
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "₹${gameData[i]["prizePool"]!}",
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w800),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const VerifyScreen())),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.circular(kdefaulPadding)),
                          padding: const EdgeInsets.symmetric(
                              vertical: kdefaulPadding / 3,
                              horizontal: kdefaulPadding),
                          child: Text(
                            "₹${gameData[i]["discounted_entry"]!}",
                            style: const TextStyle(color: kWhite, fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: kdefaulPadding / 3,
                  ),
                  LinearProgressIndicator(
                    // value: controller.value,
                    value: 0.5,
                    semanticsLabel: 'Linear progress indicator',
                    color: kPrimaryColor,
                    backgroundColor: kPrimaryColor.withOpacity(0.1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${gameData[i]["spots_left"]!} spots left",
                        style: const TextStyle(color: Colors.red),
                      ),
                      Text(
                        "${gameData[i]["spots"]!}spots",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: kdefaulPadding),
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(kdefaulPadding),
                  bottomRight: Radius.circular(kdefaulPadding),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.looks_one_outlined),
                  Text(
                    "₹${gameData[i]["winners_prize"]!} ",
                  ),
                  const Icon(Icons.emoji_events_outlined),
                  Text(
                    "${gameData[i]["win_ratio"]!}%",
                  ),
                  const Icon(Icons.api_outlined),
                  Text(
                    gameData[i]["upto"]!,
                  ),
                  const Spacer(),
                  const Icon(Icons.verified_outlined),
                  Text(
                    "${gameData[i]["garanteed"]!} ",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
