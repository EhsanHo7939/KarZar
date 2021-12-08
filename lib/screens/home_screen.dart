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
  List<String> image = ['assets/Khoy_city.png', 'assets/khoy.png'];
  int intColor = 0;
  final ScrollController controller = ScrollController();
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
    double? karzarHeightSize = 160;
    return isWeb <= 566
        ? Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.grey[200],
          leading: Card(
            margin: const EdgeInsets.only(right: 10),
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(
              'assets/khoy.png',
              fit: BoxFit.cover,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'دارالصفا',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                'بنیاد توسعه خوی',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
              // Divider(color: Colors.black,height: 2,)
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: SingleChildScrollView(
            //physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Divider(
                //   color: Colors.black,
                //   height: 2,
                // ),
                const SizedBox(
                  height: 10,
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
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10, left: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "موضوع نظرسنجی را جستجو کنید ..."),
                            ),
                          ),
                        ),
                        Card(
                          margin: const EdgeInsets.only(left: 10),
                          color: taskBlue1,
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

                /// center header image
                /// with card
                headerImage(),

                const SizedBox(
                  height: 10,
                ),

                /// start karzar
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    "نظرسنجی ها",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    List<Color> backgroundColor1 = [
                      taskBlue1,
                      taskGreen1,
                      taskDeepPurple1,
                    ];
                    List<Color> backgroundColor2 = [
                      taskBlue2,
                      taskGreen2,
                      taskDeepPurple2,
                    ];
                    Color currentColor1 = backgroundColor1[intColor];
                    Color currentColor2 = backgroundColor2[intColor];
                    intColor++;
                    if (intColor == 3) {
                      intColor = 0;
                    }
                    return Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: .5, color: currentColor1),
                          borderRadius: BorderRadius.circular(10)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.white,
                      child: InkWell(
                        onTap: () {

                        },
                        child: SizedBox(
                          height: karzarHeightSize,
                          child: Stack(
                            children: [
                              Container(
                                height: karzarHeightSize * .43,
                                width: double.infinity,
                                padding: const EdgeInsets.only(right: 150),
                                color: currentColor1,
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 6),
                                  child: Text(
                                    "2,471 نفر\nرای داده اند.",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              Container(
                                height: karzarHeightSize * 1,
                                width: double.infinity,
                                padding: EdgeInsets.only(
                                    right: 150, top: karzarHeightSize * .42),
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 12),
                                  child: Text(
                                    "موضوع سوال اینجا \n قرار میگیرد.",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  margin: const EdgeInsets.only(right: 12),
                                  child: SizedBox(
                                      height: 120,
                                      width: 120,
                                      child: Image.asset(
                                        'assets/Khoy_city.png',
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(
                                    left: 20, top: karzarHeightSize * .24),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundColor: currentColor2,
                                    child: const Icon(
                                      Icons.border_color_outlined,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 9,
                )
              ],
            ),
          ),
        ),
      ),
    )
        : Scaffold(
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 100)
                        .copyWith(bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const CustomAdminAppBar(),
                    Stack(
                      children: <Widget>[
                        Container(
                          width: 1500,
                          height: 350,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
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
                                    'center',
                                    textAlign: TextAlign.center,
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
                    SizedBox(
                      height: 500,
                      child: FutureBuilder<List<dynamic>>(
                        future: Networking().getQs(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Widget> questions = [];
                            for (int i = 0; i < snapshot.data!.length; i++) {
                              String qBody = snapshot.data![i][1].toString();
                              final gridBubble = GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    QuestionScreen.id,
                                    arguments: snapshot.data![i][0] as int,
                                  );
                                },
                                child: GridsBubble(
                                  qBody: qBody,
                                  color: getRandomColor(),
                                ),
                              );

                              questions.add(gridBubble);
                            }

                            return GridView(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: isWeb < 1260
                                    ? isWeb < 900
                                        ? 1
                                        : 2
                                    : 3,
                                crossAxisSpacing: 10,
                              ),
                              children: questions,
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Widget headerImage() {
    return Card(
      color: taskBlue1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: AspectRatio(
        aspectRatio: 3.5 / 2,
        child: Stack(
          children: [
            Image.asset(
              'assets/Khoy_city.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Center(
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: const CircleBorder(),
                margin: const EdgeInsets.all(20.0),
                color: taskBlue1,
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
                            fontSize: 16),
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
                            fontFamily: 'vazir-bold'),
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

Color taskBlue1 = const Color(0xff0dceff);
Color taskBlue2 = const Color(0xff00c2f1);
Color taskGreen1 = const Color(0xe800dc3d);
Color taskGreen2 = const Color(0xff00d241);
Color taskDeepPurple1 = const Color(0xffbf4dff);
Color taskDeepPurple2 = const Color(0xffb62cff);