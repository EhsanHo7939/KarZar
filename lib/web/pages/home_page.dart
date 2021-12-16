import 'package:kar_zar/web/custom_widgets/appbar.dart';
import 'package:kar_zar/web/custom_widgets/grids.dart';
import 'package:kar_zar/web/pages/question_page.dart';
import 'package:kar_zar/networking/api.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class WebHomePage extends StatefulWidget {
  const WebHomePage({Key? key}) : super(key: key);
  static const String id = 'web_home_page';

  @override
  _WebHomePageState createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
  Random random = Random();
  List<dynamic>? votes;
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
    double? pageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100).copyWith(bottom: 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const AdminWebBar(),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Card(
                    color: Colors.grey[300],
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(width: .5, color: Colors.grey), borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 10, left: 10),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "موضوع نظرسنجی را جستجو کنید ...",
                                ),
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
                                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                                child: Text(
                                  "جستجو",
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                              ),
                              onTap: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Stack(
                  children: <Widget>[
                    Image.asset(
                      'images/Khoy_city.jpg',
                      width: double.infinity,
                      height: 350,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      top: 70,
                      left: (pageWidth / 2) - 200,
                      child: Card(
                        color: Colors.cyan,
                        shape: const CircleBorder(
                          side: BorderSide(
                            width: 1,
                            color: Colors.cyan,
                          ),
                        ),
                        child: SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "میزبان",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 6),
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
                              const SizedBox(height: 6),
                              const Text(
                                "رای برای کنشگری\n شهرستان خوی ",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                          ),
                          width: 200,
                          height: 200,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(),
                FutureBuilder<List<dynamic>>(
                  future: Networking().getQs(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Widget> questions = [];
                      for (int i = 0; i < snapshot.data!.length; i++) {
                        String qBody = snapshot.data![i]['Q_Body'].toString();
                        int id = snapshot.data![i]['id'] as int;
                        String author = snapshot.data![i]['author_info']['first_name'];
                        final gridBubble = GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WebQuestionPage(
                                  questionId: id,
                                ),
                              ),
                            );
                          },
                          child: WebGrids(
                            qBody: qBody,
                            vote: id,
                            author: author,
                            color: getRandomColor(),
                          ),
                        );

                        if (questions.length < 6) {
                          questions.add(gridBubble);
                        }
                      }

                      return GridView(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: pageWidth < 1513.9
                              ? pageWidth <= 1074
                                  ? 1
                                  : 2
                              : 3,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.4,
                        ),
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
