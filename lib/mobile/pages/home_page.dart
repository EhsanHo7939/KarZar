import 'package:kar_zar/mobile/custom_widgets/appbar.dart';
import 'package:kar_zar/mobile/pages/question_page.dart';
import 'package:kar_zar/mobile/custom_widgets/grid.dart';
import 'package:kar_zar/networking/api.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({Key? key}) : super(key: key);
  static const String id = 'mobile_home_page';

  @override
  _MobileHomePageState createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  final ScrollController controller = ScrollController();
  int intColor = 0;
  Random random = Random();
  List<dynamic>? votes;
  String? searchedValue;
  Future<List<dynamic>>? future = Networking().getQs();
  List? colors = [
    Colors.amber[700],
    Colors.green[700],
    Colors.teal[800],
    Colors.blue[700],
    Colors.purple,
  ];

  Color getRandomColor() {
    int color = random.nextInt(5);
    return colors![color];
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Directionality(
                  textDirection: TextDirection.ltr,
                  child: MobileBar(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.grey[300],
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(width: .5, color: Colors.grey), borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: TextField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "موضوع نظرسنجی را جستجو کنید ...",
                              ),
                              onChanged: (value) => searchedValue = value,
                            ),
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.only(left: 10),
                          color: const Color(0xff0dceff),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: InkWell(
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                              child: Text(
                                "جستجو",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                if (searchedValue == null || searchedValue == '') {
                                  future = future = Networking().getQs();
                                } else {
                                  future = Networking().searchQ(searchedValue!);
                                }
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  color: const Color(0xff0dceff),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: AspectRatio(
                    aspectRatio: 3.5 / 2,
                    child: Stack(
                      children: [
                        Image.asset(
                          'images/Khoy_city_mobile.jpg',
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Center(
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: const CircleBorder(),
                            margin: const EdgeInsets.all(20.0),
                            color: const Color(0xff0dceff),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "میزبان",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  FutureBuilder<List<dynamic>>(
                                    future: Networking().getVotes(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        int totalVotes = snapshot.data![0]['id'];
                                        return Text(
                                          "$totalVotes",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            fontFamily: 'vizier-bold',
                                          ),
                                        );
                                      }
                                      if (!snapshot.hasData) {
                                        return const Center(child: CircularProgressIndicator());
                                      }
                                      return Container();
                                    },
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  const Text(
                                    "رای برای کنشگری\n شهرستان خوی ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    "نظرسنجی ها",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                FutureBuilder<List<dynamic>>(
                  future: future,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Widget> questions = [];
                      for (int i = 0; i < snapshot.data!.length; i++) {
                        String qBody = snapshot.data![i]['Q_Body'].toString();
                        int id = snapshot.data![i]['id'] as int;
                        String authorFirstName = snapshot.data![i]['author_info']['first_name'];
                        String authorLastName = snapshot.data![i]['author_info']['last_name'];
                        final mobileGridsBubble = GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MobileQuestionPage(
                                  questionId: id,
                                ),
                              ),
                            );
                          },
                          child: MobileGrids(
                            qBody: qBody,
                            authorFirstName: authorFirstName,
                            authorLastName: authorLastName,
                            vote: id,
                            color: getRandomColor(),
                          ),
                        );
                        questions.add(mobileGridsBubble);
                      }
                      return ListView(
                        shrinkWrap: true,
                        children: questions,
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
