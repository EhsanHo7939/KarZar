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
        ? const Scaffold()
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
}
