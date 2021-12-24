import 'package:kar_zar/mobile/pages/question_page.dart';
import 'package:kar_zar/mobile/widgets/bottombar.dart';
import 'package:kar_zar/mobile/widgets/appbar.dart';
import 'package:kar_zar/mobile/widgets/grid.dart';
import 'package:kar_zar/utilities/api.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({Key? key}) : super(key: key);
  static const String id = '/home';

  @override
  _MobileHomePageState createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  final ScrollController controller = ScrollController();
  Random random = Random();
  List<dynamic>? votes;
  String? searchedValue;
  Future<List<dynamic>>? future = Api.getQs();
  bool isLoggedIn = false;
  List? colors = [
    Colors.amber[700],
    Colors.green[700],
    Colors.purple[400],
    Colors.teal[800],
    Colors.blue[700],
    Colors.pinkAccent
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12, left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Directionality(
                        textDirection: TextDirection.ltr,
                        child: MobileBar(),
                      ),
                      Card(
                        color: Colors.grey[300],
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(width: .5, color: Colors.grey),
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10, left: 10),
                                  child: TextField(
                                    textInputAction: TextInputAction.search,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "جستجو کنید ...",
                                      hintStyle: TextStyle(fontWeight: FontWeight.bold)),
                                    onChanged: (value) => searchedValue = value,
                                    onSubmitted: (value){
                                      setState(() {
                                      if (searchedValue == null || searchedValue == '') {
                                        future = future = Api.getQs();
                                      } else {
                                        future = Api.searchQ(searchedValue!);
                                      }
                                    });
                                    },
                                  ),
                                ),
                              ),
                              Card(
                                margin: const EdgeInsets.only(left: 6),
                                color: const Color(0xff0dceff),
                                shape:
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                                    child: Text(
                                      "جستجو",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      if (searchedValue == null || searchedValue == '') {
                                        future = future = Api.getQs();
                                      } else {
                                        future = Api.searchQ(searchedValue!);
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: AspectRatio(
                          aspectRatio: 1.5,
                          child: Stack(
                            children: [
                              Image.asset(
                                'images/Khoy_city_mobile.jpg',
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.fill,
                              ),
                              Center(
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: const CircleBorder(),
                                  margin: const EdgeInsets.all(20.0),
                                  color: Colors.white.withOpacity(.7),
                                  elevation: 20,
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
                                            fontSize: 18,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: FutureBuilder<List<dynamic>>(
                                            future: Api.getVotes(),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                int? totalVotes;
                                                if (snapshot.data!.isEmpty) totalVotes = 0;
                                                if (snapshot.data!.isNotEmpty) {
                                                  totalVotes = snapshot.data![0]['id'];
                                                }
                                                return Text(
                                                  "$totalVotes",
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22,
                                                    fontFamily: 'Vazir-Bold',
                                                  ),
                                                );
                                              }
                                              if (!snapshot.hasData) {
                                                return const Center(
                                                  child: CircularProgressIndicator(),
                                                );
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
                      const Padding(
                        padding: EdgeInsets.only(right: 10,top: 10,bottom: 5),
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
                            int colorId = -1;
                            for (int i = 0; i < snapshot.data!.length; i++) {
                              colorId++;
                              if (colorId == 6) colorId = 0;
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
                                  color: colors![colorId],
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
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: MobileBottomBar(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
