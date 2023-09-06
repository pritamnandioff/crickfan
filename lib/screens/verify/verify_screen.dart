import 'package:crickfan/const.dart';
import 'package:flutter/material.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  int isSelected = 0;
  List<String> verifyMethods = [
    "Enter Adhaar Number",
    "Verify Adhaar via OTP",
    "Upload Aadhar",
    "Upload Voter ID",
    "Upload Driving License"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    color: Colors.grey,
                    child: const Center(child: Text("600*300")),
                  ),
                  // Image.network(
                  //   "https://fakeimg.pl/700x210/",
                  //   fit: BoxFit.contain,
                  // ),
                  Positioned(
                      // left: 20,
                      // top: 10,
                      child: IconButton(
                    icon: const Icon(Icons.arrow_back_outlined),
                    onPressed: () => Navigator.pop(context),
                  )),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: kdefaulPadding,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: verifyMethods.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kdefaulPadding),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(kdefaulPadding),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: kdefaulPadding,
                              vertical: kdefaulPadding),
                          onTap: () => setState(() {
                            isSelected = index;
                          }),
                          leading: const CircleAvatar(
                            radius: kdefaulPadding * 2,
                            backgroundColor: kPrimaryColor,
                          ),
                          title: Text(verifyMethods[index]),
                          trailing: Icon(isSelected == index
                              ? Icons.check_circle_outline_outlined
                              : Icons.circle_outlined),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: kdefaulPadding,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.all(kdefaulPadding / 2),
        height: 130,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: const Text("Continue"),
              ),
            ),
            const Text(
                "Note: Any account, once submitted can't be unlinked and used on any other account")
          ],
        ),
      ),
    );
  }
}
