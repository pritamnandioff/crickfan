import 'dart:convert';
import 'package:crickfan/const.dart';
import 'package:crickfan/models/series_list_model.dart';
import 'package:crickfan/screens/match/match_screen.dart';
import 'package:crickfan/screens/widgets/home_loading.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;

class CricketScreen extends StatefulWidget {
  final scrollBottomBarController = ScrollController();
  CricketScreen({
    super.key,
  });

  @override
  State<CricketScreen> createState() => _CricketScreenState();
}

class _CricketScreenState extends State<CricketScreen>
    with SingleTickerProviderStateMixin {
  double screenHeight = 0;

  double screenWidth = 0;

  bool startAnimation = false;

  late Future productdata;

  loadAnimation() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  Future<SeriesListModel> getRequest() async {
    String url =
        "https://api.cricapi.com/v1/series?apikey=8d3a7a72-dd2c-45d4-bb7a-81925103f3ba&offset=0";
    final response = await http.get(Uri.parse(url));
    print(response.body);

    return SeriesListModel.fromJson(json.decode(response.body));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 10,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MatchScreen(index: i))),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: kSecoundaryColor,
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: NetworkImage(
                              "https://fakeimg.pl/600x130/",
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: kdefaulPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Banner",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  child: Icon(Icons.notification_add_outlined),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(kdefaulPadding),
                      bottomLeft: Radius.circular(kdefaulPadding),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 6,
            decoration: const BoxDecoration(
              color: kSecoundaryColor,
              image: DecorationImage(
                image: NetworkImage(
                  "https://fakeimg.pl/640x200/",
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: kdefaulPadding),
            child: Text(
              "Upcomming Matches",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FutureBuilder(
            // future: productdata,
            future: getRequest(),
            builder: (BuildContext context, AsyncSnapshot snap) {
              if (snap.connectionState == ConnectionState.done) {
                if (snap.hasError) {
                  return const Center(
                    child: Text("Something went wrong ….!"),
                  );
                } else if (snap.hasData) {
                  return ListView.builder(
                    controller: widget.scrollBottomBarController,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: snap.data.data.length,
                    itemBuilder: (_, i) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MatchScreen(index: i))),
                        child: AnimatedContainer(
                          height: 200,
                          width: screenWidth,
                          curve: Curves.easeInOut,
                          duration: Duration(milliseconds: 300 + (i * 5000)),
                          transform: Matrix4.translationValues(
                              startAnimation ? 0 : screenWidth, 0, 0),
                          margin: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kdefaulPadding),
                            color: Colors.white,
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
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: kdefaulPadding / 2),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft:
                                            Radius.circular(kdefaulPadding),
                                      ),
                                      color: Colors.grey,
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      snap.data.data[i].name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.telegram_outlined),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          right: kdefaulPadding / 2),
                                      child: Text(snap.data.data[i].startDate)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://fakeimg.pl/640x200/"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: kdefaulPadding / 2),
                                    child: Text(snap.data.data[i].endDate),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              }
              return const HomeLoading();
            },
          ),
        ],
      ),
    );
  }
}
