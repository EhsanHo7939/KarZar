import 'package:kar_zar/custom_widgets/grids_bubble.dart';
import 'package:kar_zar/screens/question_screen.dart';
import 'package:kar_zar/custom_widgets/appbar.dart';
import 'package:kar_zar/networking/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController controller = ScrollController();
  int intColor = 0;
  Random random = Random();

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
    double? isWeb = MediaQuery.of(context).size.width;

    return isWeb <= 566
        ? Directionality(
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
                        child: CustomAppBar(
                          headerFontSize: 18,
                          descriptionFontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        color: Colors.grey[300],
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(width: .5, color: Colors.grey),
                            borderRadius: BorderRadius.circular(12)),
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
                                      hintText:
                                          "موضوع نظرسنجی را جستجو کنید ...",
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                margin: const EdgeInsets.only(left: 10),
                                color: const Color(0xff0dceff),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 6),
                                    child: Text(
                                      "جستجو",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      headerImage(),
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
                      FutureBuilder<Map<String, dynamic>>(
                        future: Networking().getQs(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Widget> questions = [];
                            for (int i = 0;
                                i < snapshot.data!['data'].length;
                                i++) {
                              String qBody =
                                  snapshot.data!['data'][i]['qBody'].toString();
                              final mobileGridsBubble = GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    QuestionScreen.id,
                                    arguments:
                                        snapshot.data!['data'][i]['id'] as int,
                                  );
                                },
                                child: MobileGridsBubble(
                                  qBody: qBody,
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
          )
        : Scaffold(
            backgroundColor: Colors.grey[200],
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 100)
                        .copyWith(bottom: 0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      const CustomAppBar(
                        headerFontSize: 24,
                        descriptionFontSize: 18,
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            width: 1500,
                            height: 350,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://pbs.twimg.com/media/CikvNL3WUAAWY_m.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 70,
                            left: (isWeb / 2) - 200,
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
                                  children: const <Widget>[
                                    Text(
                                      "میزبان",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "۵۰,۰۰۰",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontFamily: 'vizier-bold',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Text(
                                      "رای برای کنشگری\n شهرستان خوی ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                height: 200,
                                width: 200,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      FutureBuilder<Map<String, dynamic>>(
                        future: Networking().getQs(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Widget> questions = [];
                            for (int i = 0;
                                i < snapshot.data!['data'].length;
                                i++) {
                              String qBody =
                                  snapshot.data!['data'][i]['qBody'].toString();
                              final gridBubble = GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    QuestionScreen.id,
                                    arguments:
                                        snapshot.data!['data'][i]['id'] as int,
                                  );
                                },
                                child: GridsBubble(
                                  qBody: qBody,
                                  color: getRandomColor(),
                                ),
                              );

                              if (questions.length < 6) {
                                questions.add(gridBubble);
                              }
                            }

                            return GridView(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: isWeb < 1513.9
                                    ? isWeb <= 1074
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

  Widget headerImage() {
    return Card(
      color: const Color(0xff0dceff),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: AspectRatio(
        aspectRatio: 3.5 / 2,
        child: Stack(
          children: [
            const Image(
              image: NetworkImage(
                  'https://pbs.twimg.com/media/CikvNL3WUAAWY_m.jpg'), // TODO : Fix image fit
              width: double.infinity,
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
                    children: const [
                      Text(
                        "میزبان",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "۵۰,۰۰۰",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'vazir-bold',
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "رای برای کنشگری\n شهرستان خوی ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
