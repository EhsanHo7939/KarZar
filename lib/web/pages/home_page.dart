import 'package:kar_zar/web/custom_widgets/appbar.dart';
import 'package:kar_zar/web/custom_widgets/bottombar.dart';
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
    double? pageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100)
                  .copyWith(bottom: 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const AdminWebBar(),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: Colors.grey[300],
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: .5, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5),),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12,left: 12),
                                child: TextField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "موضوع نظرسنجی را جستجو کنید ...",
                                  ),
                                  onChanged: (value) => searchedValue = value,
                                ),
                              ),
                            ),flex: 6,
                          ),
                          Expanded(
                            child: Card(
                              color: const Color(0xff0dceff),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: InkWell(
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 35, vertical: 12),
                                  child: Center(
                                    child: Text(
                                      "جستجو",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    if (searchedValue == null ||
                                        searchedValue == '') {
                                      future = future = Networking().getQs();
                                    } else {
                                      future =
                                          Networking().searchQ(searchedValue!);
                                    }
                                  });
                                },
                              ),
                            ),flex: 1,
                          ),
                        ],
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
                          top: 50,
                          left: (pageWidth / 2) - 225,
                          child: Card(
                            shape: const CircleBorder(),
                            color: Colors.white.withOpacity(.7),
                            elevation: 20,
                            child: SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text(
                                    "میزبان",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: FutureBuilder<List<dynamic>>(
                                      future: Networking().getVotes(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          int totalVotes =
                                              snapshot.data![0]['id'];
                                          return Text(
                                            "$totalVotes",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22,
                                              fontFamily: 'Vazir-Bold'
                                            ),
                                          );
                                        }

                                        if (!snapshot.hasData) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator(),);
                                        }
                                        return Container();
                                      },
                                    ),
                                  ),
                                  const Text(
                                    "رای برای کنشگری\n شهرستان خوی ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              width: 250,
                              height: 250,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    FutureBuilder<List<dynamic>>(
                      future: future,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Widget> questions = [];
                          for (int i = 0; i < snapshot.data!.length; i++) {
                            String qBody =
                                snapshot.data![i]['Q_Body'].toString();
                            int id = snapshot.data![i]['id'] as int;
                            String authorFirstName =
                                snapshot.data![i]['author_info']['first_name'];
                            String authorLastName =
                                snapshot.data![i]['author_info']['last_name'];
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
                                authorFirstName: authorFirstName,
                                authorLastName: authorLastName,
                                color: getRandomColor(),
                              ),
                            );

                            if (questions.length < 6) {
                              questions.add(gridBubble);
                            }
                          }

                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: GridView(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: pageWidth < 1513.9
                                    ? pageWidth <= 1074
                                        ? 1
                                        : 2
                                    : 3,
                                crossAxisSpacing: 10,
                                childAspectRatio: 1.4,
                              ),
                              children: questions,
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                  ],
                ),
              ),
            ),
            const WebBottomBar()
          ],
        ),
      ),
    );
  }
}
